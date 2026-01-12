import "FungibleToken"
import "FlowToken"

/// This transaction revokes the key at index 0 of the four input accounts.
/// 0xfd595328d97d33d5 0x2ef3addd3d2fdcb2 0x876d79eb09383877 0x1d84e60dc3a2f0c7
transaction() {

    prepare(serviceAccount: auth(Storage, BorrowValue) &Account,
        attackerAccount1: auth(RevokeKey) &Account, //0xfd595328d97d33d5
        attackerAccount2: auth(RevokeKey) &Account, //0x2ef3addd3d2fdcb2
        attackerAccount3: auth(RevokeKey) &Account, //0x876d79eb09383877
        attackerAccount4: auth(RevokeKey, Capabilities, BorrowValue) &Account  //0x1d84e60dc3a2f0c7
        ) {

        // First, we need to deposit enough FLOW into 0x1d84e60dc3a2f0c7 for storage deposit
        // Initial balance: 0.0009
        // Storage deposit: 0.001
        // Top-up: 0.0001
        let vaultRef = serviceAccount.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)
                    ?? panic("The signer does not store a FlowToken Vault")
        let receiverRef = attackerAccount4
                    .capabilities.borrow<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
                    ?? panic("Could not borrow a Receiver reference to the FlowToken Vault in account")

        receiverRef.deposit(from: <-vaultRef.withdraw(amount: 0.0001))

        attackerAccount1.keys.revoke(keyIndex: 0)
        attackerAccount2.keys.revoke(keyIndex: 0)
        attackerAccount3.keys.revoke(keyIndex: 0)
        attackerAccount4.keys.revoke(keyIndex: 0)
    }
}
