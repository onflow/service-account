import FlowToken from 0x1654653399040a61
import FungibleToken from 0xf233dcee88fe0abe
import RetrieveFraudulentTokensEvents from 0xe467b9dd11fa00df

/// Include your transaction's parameters here
access(all) fun main() {

    // Add the authorizer's address here
    // Typically this is the the service account address
    // so it is provided here by default
    let authorizer: Address = 0xe467b9dd11fa00df
    
    let amount = 1.0 // TODO: adjust this to the exact amount
    let serviceAccount = getAuthAccount<auth(Storage, Capabilities, BorrowValue) &Account>(authorizer)

    let fraudulentFlowTokenVaultPath =  /storage/fraudulentFlowTokenVault
    let defaultFlowTokenVaultPath = /storage/flowTokenVault

     // Store a new FlowToken Vault at a non-standard storage path to hold fraudulent tokens
     let emptyVault <- FlowToken.createEmptyVault(vaultType: Type<@FlowToken.Vault>())
     serviceAccount.storage.save(<-emptyVault, to: fraudulentFlowTokenVaultPath)

    // Load the fraudulent token vault from storage
    let fraudulentTokenVault <- serviceAccount.storage.load<@{FungibleToken.Vault}>(from: fraudulentFlowTokenVaultPath)
        ?? panic("The serviceAccount does not store a FungibleToken.Vault object at the path ".concat(" \(fraudulentFlowTokenVaultPath.toString())."))

     // Get a reference to the service account's default flow vault
     let serviceAccountDefaultVaultRef = serviceAccount.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: defaultFlowTokenVaultPath)
         ?? panic("Failed to borrow FlowToken ref from ".concat(" \(defaultFlowTokenVaultPath.toString())."))

     // Withdraw tokens from the default flow vault
     let vault <- serviceAccountDefaultVaultRef.withdraw(amount: amount)

     // Get a reference to resource to emit events for retrieving tokens
     let eventAdmin = serviceAccount.storage.borrow<&RetrieveFraudulentTokensEvents.Admin>(from: RetrieveFraudulentTokensEvents.adminStoragePath)
         ?? panic("The service account does not store a RetrieveFraudulentTokensEvents.Admin object at the path \(RetrieveFraudulentTokensEvents.adminStoragePath)")

     // Deposit the tokens into the service account's fraudulent vault
     fraudulentTokenVault.deposit(from: <-vault)

     eventAdmin.emitRetrieveTokensEvent(typeIdentifier: "A.1654653399040a61.FlowToken.Vault", amount: amount, fromAddress: serviceAccount.address.toString())

    eventAdmin.emitDestroyTokensEvent(typeIdentifier: fraudulentTokenVault.getType().identifier, amount: fraudulentTokenVault.balance)

    // Destroy the tokens
    destroy <-fraudulentTokenVault

}
