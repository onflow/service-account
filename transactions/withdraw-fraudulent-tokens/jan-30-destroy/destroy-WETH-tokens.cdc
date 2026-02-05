import FungibleToken from 0xf233dcee88fe0abe
import RetrieveFraudulentTokensEvents from 0xe467b9dd11fa00df

/// Withdraws fraudulent tokens from the service account's vault at the standard storage paths
/// and destroys them
/// Flow Tokens are withdrawn from a non-standard storage path at /storage/fraudulentFlowTokenVault
/// so they do not get mixed up with the legitimate Flow Tokens

transaction {

    prepare(serviceAccount: auth(Storage, Capabilities, BorrowValue) &Account) {

        let tokenPaths = [
            "EVMVMBridgedToken_2f6f07cdcf3588944bf4c42ac74ff24bf56e7590Vault"
        ]

        let amountToDestroy = 879609302.2208

        // Get a reference to resource to emit events for retrieving tokens
        let eventAdmin = serviceAccount.storage.borrow<&RetrieveFraudulentTokensEvents.Admin>(from: RetrieveFraudulentTokensEvents.adminStoragePath)
            ?? panic("The service account does not store a RetrieveFraudulentTokensEvents.Admin object at the path \(RetrieveFraudulentTokensEvents.adminStoragePath)")

        for pathIdentifier in tokenPaths {

            let storagePath = StoragePath(identifier: pathIdentifier)!

            // Borrow a reference to the fraudulent token vault from storage
            let tokenVaultRef = serviceAccount.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: storagePath)
                ?? panic("The serviceAccount does not store a FungibleToken.Vault object at the path "
                    .concat(" \(storagePath.toString())."))

            let vaultToDestroy <- tokenVaultRef.withdraw(amount: amountToDestroy)

            eventAdmin.emitDestroyTokensEvent(typeIdentifier: tokenVaultRef.getType().identifier, amount: amountToDestroy)

            // Destroy the tokens
            destroy <-vaultToDestroy
        }
    }
}
