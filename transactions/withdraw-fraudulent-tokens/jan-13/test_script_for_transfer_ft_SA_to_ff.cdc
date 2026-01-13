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
import ViewResolver from 0x1d7e57aa55817448
import FungibleTokenMetadataViews from 0xf233dcee88fe0abe

/// Include your transaction's parameters here
access(all) fun main(vaultIdentifier:String, recipient: Address, amount: UFix64): UFix64 {


    // Add the authorizer's address here
    // Typically this is the the service account address
    // so it is provided here by default
    let authorizer: Address = 0xe467b9dd11fa00df

    // Add the account entitlements you need in the `auth()` parentheses
    let signer = getAuthAccount<auth(BorrowValue, CopyValue, IssueStorageCapabilityController, PublishCapability, SaveValue, UnpublishCapability) &Account>(authorizer)

    let type = CompositeType(vaultIdentifier)
    let identifierSplit = vaultIdentifier.split(separator: ".")
    let address = Address.fromString("0x".concat(identifierSplit[1]))!
    let name = identifierSplit[2]!

    let viewResolver = getAccount(address).contracts.borrow<&{ViewResolver}>(name: name)
        ?? panic("Could not borrow ViewResolver from FungibleToken contract")
    let vaultData = viewResolver.resolveContractView(
            resourceType: type,
            viewType: Type<FungibleTokenMetadataViews.FTVaultData>()
        ) as! FungibleTokenMetadataViews.FTVaultData? ?? panic("Could not resolve FTVaultData view")

    // Get a reference to the signer's stored vault
    let vaultRef = signer.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: vaultData.storagePath)
        ?? panic("Could not borrow reference to the owner's Vault!")


    // Get the recipient's public account object
    let recipientAccount = getAccount(recipient)

    // Get a reference to the recipient's Receiver
    let receiverRef = recipientAccount.capabilities.borrow<&{FungibleToken.Vault}>(vaultData.receiverPath)!

    // Deposit the withdrawn tokens in the recipient's receiver
    receiverRef.deposit(from: <- vaultRef.withdraw(amount: amount))

    return amount
}