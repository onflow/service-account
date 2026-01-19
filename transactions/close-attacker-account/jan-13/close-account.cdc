import "FungibleToken"
import "FlowToken"

/// This transaction closes accounts involved in the Dec 27 incidents:
///  - 0xfd595328d97d33d5
///  - 0x2ef3addd3d2fdcb2
///  - 0x876d79eb09383877
///  - 0x1d84e60dc3a2f0c7
///
/// The transaction:
///  - withdraws outstanding balance to the service account (so final balance is exactly the storage deposit)
///  - revokes the key at index 0 of the four input accounts (the only key for each)
transaction() {

    prepare(serviceAccount: auth(Storage, BorrowValue) &Account,
        attackerAccount1: auth(RevokeKey, Capabilities, Storage, BorrowValue) &Account, //0xfd595328d97d33d5
        attackerAccount2: auth(RevokeKey, Capabilities, Storage, BorrowValue) &Account, //0x2ef3addd3d2fdcb2
        attackerAccount3: auth(RevokeKey, Capabilities) &Account, //0x876d79eb09383877
        attackerAccount4: auth(RevokeKey, Capabilities, BorrowValue) &Account  //0x1d84e60dc3a2f0c7
        ) {

         // First, we withdraw outstanding balance from accounts with any balance
        // Balances:
        // 1: 0xfd595328d97d33d5 270.00753892
        // 2: 0x2ef3addd3d2fdcb2 150.87525000
        // So withdraw:
        // 1. 270.00653892 from 0xfd595328d97d33d5
        // 2. 150.87425 from 0x2ef3addd3d2fdcb2
        let attacker1VaultRef = attackerAccount1.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)
                                                    ?? panic("The signer does not store a FlowToken Vault")
        let attacker2VaultRef = attackerAccount2.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)
                                                    ?? panic("The signer does not store a FlowToken Vault")

        // Next, we need to deposit enough FLOW into 0x1d84e60dc3a2f0c7 for storage deposit
        // Initial balance: 0.0009
        // Storage deposit: 0.001
        // Top-up: 0.0001
        let saVaultRef = serviceAccount.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)
                    ?? panic("The signer does not store a FlowToken Vault")
        let receiverRef = attackerAccount4
                    .capabilities.borrow<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
                    ?? panic("Could not borrow a Receiver reference to the FlowToken Vault in account")

        receiverRef.deposit(from: <-attacker1VaultRef.withdraw(amount: 0.0001))

       
        // Deposit excess balance into service account's REGULAR vault (not the special vault for fraudulent tokens).
        saVaultRef.deposit(from: <-attacker1VaultRef.withdraw(amount: attacker1VaultRef.balance-0.001))
        saVaultRef.deposit(from: <-attacker2VaultRef.withdraw(amount: attacker2VaultRef.balance-0.001))

        // Unpublish the receiver so no further funds can be deposited
        attackerAccount1.capabilities.unpublish(/public/flowTokenReceiver)
        attackerAccount2.capabilities.unpublish(/public/flowTokenReceiver)
        attackerAccount3.capabilities.unpublish(/public/flowTokenReceiver)
        attackerAccount4.capabilities.unpublish(/public/flowTokenReceiver)

        // Finally, revoke all keys on all attacker accounts, rendering them permanently inoperable
        attackerAccount1.keys.revoke(keyIndex: 0)
        attackerAccount2.keys.revoke(keyIndex: 0)
        attackerAccount3.keys.revoke(keyIndex: 0)
        attackerAccount4.keys.revoke(keyIndex: 0)
    }
}
