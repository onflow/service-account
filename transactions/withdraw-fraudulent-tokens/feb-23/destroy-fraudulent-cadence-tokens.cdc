import FungibleToken from 0xf233dcee88fe0abe
import RetrieveFraudulentTokensEvents from 0xe467b9dd11fa00df

/// Withdraws Flow tokens from the service account's Flow token vault at storage path /storage/flowTokenVault vault
/// and transfers it to the the token vault at stoage path /storage/fraudulentFlowTokenVault and then destroys them.
/// Will not result in any change to Flow total supply
transaction {

    prepare(serviceAccount: auth(Storage, Capabilities, BorrowValue) &Account) {

    // the amount to burn
    let amount = 50344317.76

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
}
