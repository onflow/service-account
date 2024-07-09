import FungibleToken from 0xf233dcee88fe0abe
import FlowToken from 0x1654653399040a61
import Burner from 0xf233dcee88fe0abe

// This transaction is a template for a transaction that
// could be used by any account to burn FLOW tokens
// from their stored Vault
//
// The burning amount would be a parameter to the transaction

transaction(amount: UFix64) {

    // Vault resource that holds the tokens that are being burned
    let vault: @FungibleToken.Vault

    prepare(signer: auth(BorrowValue) &Account) {

        // Withdraw tokens from the admin vault in storage
        self.vault <- signer.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)!
            .withdraw(amount: amount)
    }

    execute {
        Burner.burn(<-self.vault)
    }
}