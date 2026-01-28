import "FungibleToken"
import "RetrieveFraudulentTokensEvents"

/// Withdraws fraudulent tokens from the service account's vault at the standard storage paths
/// and destroys them
/// Flow Tokens are withdrawn from a non-standard storage path at /storage/fraudulentFlowTokenVault
/// so they do not get mixed up with the legitimate Flow Tokens

transaction {

    prepare(serviceAccount: auth(Storage, Capabilities, BorrowValue) &Account) {

        let tokenPaths = [
            "EVMVMBridgedToken_2aabea2058b5ac2d339b163c6ab6f2b6d53aabedVault",
            "EVMVMBridgedToken_717dae2baf7656be9a9b01dee31d571a9d4c9579Vault",
            "EVMVMBridgedToken_f1815bd50389c46847f0bda824ec8da914045d14Vault",
            "EVMVMBridgedToken_2f6f07cdcf3588944bf4c42ac74ff24bf56e7590Vault",
            "EVMVMBridgedToken_d3378b419feae4e3a4bb4f3349dba43a1b511760Vault",
            "ceBNBVault",
            "ceBUSDVault",
            "ceDAIVault",
            "ceUSDTVault",
            "ceWBTCVault",
            "ceWETHVault",
            "usdcFlowVault",
            "fraudulentFlowTokenVault"
        ]

        // Get a reference to resource to emit events for retrieving tokens
        let eventAdmin = serviceAccount.storage.borrow<&RetrieveFraudulentTokensEvents.Admin>(from: RetrieveFraudulentTokensEvents.adminStoragePath)
            ?? panic("The service account does not store a RetrieveFraudulentTokensEvents.Admin object at the path \(RetrieveFraudulentTokensEvents.adminStoragePath)")

        for pathIdentifier in tokenPaths {

            let storagePath = StoragePath(identifier: pathIdentifier)!

            // Load the fraudulent token vault from storage
            let fraudulentTokenVault <- serviceAccount.storage.load<@{FungibleToken.Vault}>(from: storagePath)
                ?? panic("The serviceAccount does not store a FungibleToken.Vault object at the path "
                    .concat(" \(storagePath.toString())."))

            eventAdmin.emitDestroyTokensEvent(typeIdentifier: fraudulentTokenVault.getType().identifier, amount: fraudulentTokenVault.balance)

            // Destroy the tokens
            destroy <-fraudulentTokenVault
        }
    }
}
