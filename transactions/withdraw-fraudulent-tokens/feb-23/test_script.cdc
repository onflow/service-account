import FlowToken from 0x1654653399040a61
import FungibleToken from 0xf233dcee88fe0abe
import RetrieveFraudulentTokensEvents from 0xe467b9dd11fa00df

/// Include your transaction's parameters here
access(all) fun main() {

    // Add the authorizer's address here
    // Typically this is the the service account address
    // so it is provided here by default
    let authorizer: Address = 0xe467b9dd11fa00df
    
    let amount = 50344317.76
    let serviceAccount = getAuthAccount<auth(Storage, Capabilities, BorrowValue) &Account>(authorizer)

    let defaultFlowTokenVaultPath = /storage/flowTokenVault

     // Get a reference to the service account's default flow vault
     let serviceAccountDefaultVaultRef = serviceAccount.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: defaultFlowTokenVaultPath)
         ?? panic("Failed to borrow FlowToken ref from ".concat(" \(defaultFlowTokenVaultPath.toString())."))

     // Withdraw tokens from the default flow vault
     let vault <- serviceAccountDefaultVaultRef.withdraw(amount: amount)

     // Get a reference to resource to emit events for retrieving tokens
     let eventAdmin = serviceAccount.storage.borrow<&RetrieveFraudulentTokensEvents.Admin>(from: RetrieveFraudulentTokensEvents.adminStoragePath)
         ?? panic("The service account does not store a RetrieveFraudulentTokensEvents.Admin object at the path \(RetrieveFraudulentTokensEvents.adminStoragePath)")

    eventAdmin.emitRetrieveTokensEvent(typeIdentifier: serviceAccountDefaultVaultRef.getType().identifier, amount: amount, fromAddress: serviceAccount.address.toString())

    eventAdmin.emitDestroyTokensEvent(typeIdentifier: vault.getType().identifier, amount: vault.balance)

    // Destroy the tokens
    destroy <-vault

}
