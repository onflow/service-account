import EVM from 0xe467b9dd11fa00df
import FungibleToken from 0xf233dcee88fe0abe
import FlowToken from 0x1654653399040a61
transaction() {
    let sentVault: @FlowToken.Vault
    let receiver: &{FungibleToken.Receiver}

    prepare(signer: auth(BorrowValue) &Account) {
        // Borrow a reference to the COA from the storage location we saved it to with the `EVM.Withdraw` entitlement
        let coa = signer.storage.borrow<auth(EVM.Withdraw) &EVM.CadenceOwnedAccount>(
            from: /storage/evm
        ) ?? panic("Could not borrow reference to the signer's CadenceOwnedAccount (COA). "
            .concat("Ensure the signer account has a COA stored in the canonical /storage/evm path"))

        // We must create a `EVM.Balance` struct to represent the amount of Flow tokens to withdraw
        let withdrawBalance = coa.balance()

        // Withdraw the balance from the COA, we will use this later to deposit into the receiving account
        self.sentVault <- coa.withdraw(balance: withdrawBalance) as! @FlowToken.Vault

        // Borrow the public capability to the receiving account (in this case the signer's own Vault)
        // This script could be modified to deposit into any account with a `FungibleToken.Receiver` capability
        self.receiver = signer.capabilities.borrow<&{FungibleToken.Receiver}>(/public/fraudulentFlowTokenReceiver)!
    }

    execute {
        // Deposit the withdrawn tokens into the receiving vault
        self.receiver.deposit(from: <-self.sentVault)
    }
}