/// This is a templates for a script that can be used
/// to test any transaction that we're planning to submit with the service account or staking account
///
/// In order to use this template, you'll need to:
/// 1. Include all the imports from the transaction that you're planning to test
/// 2. Replace the script's parameters with the actual parameters that you're planning to test
/// 3. Add the account that you're planning on authorizing with
/// 4. Make sure that getAuthAccount() uses the correct entitlements from your transaction
/// 5. Update the rest of the body of the script to have the same logic as the transaction
/// 6. flow scripts execute ./test_script_for_bridge_tokens_from_evm.cdc --args-json "$(cat "./bridge_tokens_from_evm_USDF.json")" -n mainnet
///

import FungibleToken from 0xf233dcee88fe0abe
import FungibleTokenMetadataViews from 0xf233dcee88fe0abe
import ViewResolver from 0x1d7e57aa55817448
import MetadataViews from 0x1d7e57aa55817448
import FlowToken from 0x1654653399040a61

import ScopedFTProviders  from 0x1e4aa0b87d10b141

import EVM from 0xe467b9dd11fa00df

import FlowEVMBridgeAccessor from 0x1e4aa0b87d10b141
import FlowEVMBridgeConfig from 0x1e4aa0b87d10b141
import FlowEVMBridgeUtils from 0x1e4aa0b87d10b141

/// Include your transaction's parameters here
access(all) fun main(vaultIdentifier: String, amount: UInt256): UFix64{

    // Add the authorizer's address here
    // Typically this is the the service account address
    // so it is provided here by default
    let authorizer: Address = 0xe467b9dd11fa00df

    // Add the account entitlements you need in the `auth()` parentheses
    let signer = getAuthAccount<auth(BorrowValue, CopyValue, IssueStorageCapabilityController, PublishCapability, SaveValue, UnpublishCapability) &Account>(authorizer)

    // Add the transaction logic here, using `signer` as the authorizer

    // prepare(signer: auth(BorrowValue, CopyValue, IssueStorageCapabilityController, PublishCapability, SaveValue, UnpublishCapability) &Account) {

    /* --- Reference the signer's CadenceOwnedAccount --- */
    //
    // Borrow a reference to the signer's COA
    let coa: auth(EVM.Bridge) &EVM.CadenceOwnedAccount= signer.storage.borrow<auth(EVM.Bridge) &EVM.CadenceOwnedAccount>(from: /storage/evm)
        ?? panic("Could not borrow COA signer's account at path /storage/evm")

    /* --- Construct the Vault type --- */
    //
    // Construct the Vault type from the provided identifier
    let vaultType: Type = CompositeType(vaultIdentifier)
        ?? panic("Could not construct Vault type from identifier: ".concat(vaultIdentifier))
    // Parse the Vault identifier into its components
    let tokenContractAddress = FlowEVMBridgeUtils.getContractAddress(fromType: vaultType)
        ?? panic("Could not get contract address from identifier: ".concat(vaultIdentifier))
    let tokenContractName = FlowEVMBridgeUtils.getContractName(fromType: vaultType)
        ?? panic("Could not get contract name from identifier: ".concat(vaultIdentifier))

    /* --- Reference the signer's Vault --- */
    //
    // Borrow a reference to the FungibleToken Vault, configuring if necessary
    let viewResolver = getAccount(tokenContractAddress).contracts.borrow<&{ViewResolver}>(name: tokenContractName)
        ?? panic("Could not borrow ViewResolver from FungibleToken contract with name"
            .concat(tokenContractName).concat(" and address ")
            .concat(tokenContractAddress.toString()))
    let vaultData = viewResolver.resolveContractView(
            resourceType: vaultType,
            viewType: Type<FungibleTokenMetadataViews.FTVaultData>()
        ) as! FungibleTokenMetadataViews.FTVaultData?
        ?? panic("Could not resolve FTVaultData view for Vault type ".concat(vaultType.identifier))
    // If the vault does not exist, create it and publish according to the contract's defined configuration
    if signer.storage.borrow<&{FungibleToken.Vault}>(from: vaultData.storagePath) == nil {
        signer.storage.save(<-vaultData.createEmptyVault(), to: vaultData.storagePath)

        signer.capabilities.unpublish(vaultData.receiverPath)
        signer.capabilities.unpublish(vaultData.metadataPath)

        let receiverCap = signer.capabilities.storage.issue<&{FungibleToken.Vault}>(vaultData.storagePath)
        let metadataCap = signer.capabilities.storage.issue<&{FungibleToken.Vault}>(vaultData.storagePath)

        signer.capabilities.publish(receiverCap, at: vaultData.receiverPath)
        signer.capabilities.publish(metadataCap, at: vaultData.metadataPath)
    }
    let receiver: &{FungibleToken.Vault} = signer.storage.borrow<&{FungibleToken.Vault}>(from: vaultData.storagePath)
        ?? panic("Could not borrow FungibleToken Vault from storage path ".concat(vaultData.storagePath.toString()))

    /* --- Configure a ScopedFTProvider --- */
    //
    // Set a cap on the withdrawable bridge fee
    var approxFee = FlowEVMBridgeUtils.calculateBridgeFee(
            bytes: 400_000 // 400 kB as upper bound on movable storage used in a single transaction
        )
    // Issue and store bridge-dedicated Provider Capability in storage if necessary
    if signer.storage.type(at: FlowEVMBridgeConfig.providerCapabilityStoragePath) == nil {
        let providerCap = signer.capabilities.storage.issue<auth(FungibleToken.Withdraw) &{FungibleToken.Provider}>(
            /storage/flowTokenVault
        )
        signer.storage.save(providerCap, to: FlowEVMBridgeConfig.providerCapabilityStoragePath)
    }
    // Copy the stored Provider capability and create a ScopedFTProvider
    let providerCapCopy = signer.storage.copy<Capability<auth(FungibleToken.Withdraw) &{FungibleToken.Provider}>>(
            from: FlowEVMBridgeConfig.providerCapabilityStoragePath
        ) ?? panic("Invalid FungibleToken Provider Capability found in storage at path "
            .concat(FlowEVMBridgeConfig.providerCapabilityStoragePath.toString()))
    let providerFilter = ScopedFTProviders.AllowanceFilter(approxFee)
    let scopedProvider: @ScopedFTProviders.ScopedFTProvider <- ScopedFTProviders.createScopedFTProvider(
            provider: providerCapCopy,
            filters: [ providerFilter ],
            expiration: getCurrentBlock().timestamp + 1.0
        )

    // execute {
    // Execute the bridge request
    let vault: @{FungibleToken.Vault} <- coa.withdrawTokens(
        type: vaultType,
        amount: amount,
        feeProvider: &scopedProvider as auth(FungibleToken.Withdraw) &{FungibleToken.Provider}
    )
    // Ensure the bridged vault is the correct type
    assert(
        vault.getType() == vaultType,
        message: "Bridged vault type mismatch - requested: ".concat(vaultType.identifier)
            .concat(", received: ").concat(vault.getType().identifier)
    )
    // Deposit the bridged token into the signer's vault
    receiver.deposit(from: <-vault)

    // Destroy the ScopedFTProvider
    destroy scopedProvider

    return receiver.balance
}
