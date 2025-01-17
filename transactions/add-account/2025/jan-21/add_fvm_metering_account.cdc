import FlowToken from 0x1654653399040a61
import FungibleToken from 0xf233dcee88fe0abe
import FlowServiceAccount from 0xe467b9dd11fa00df

// 1. Creates a new account
// 2. Creates an account capability for the new account and stores it in the service account
// 3. Transfers 5 FLOW to the new account from the signer account
// 4. Moves metering settings over to this new account

transaction() {
    let tokenReceiver: &{FungibleToken.Receiver}
    let sentVault: @{FungibleToken.Vault}

    prepare(signer: auth(AddKey, BorrowValue) &Account) {
        // create a new account
        let newAccount: auth(Storage, Contracts, Keys, Inbox, Capabilities) &Account = Account(payer: signer)

        // Create a fully-entitled account capability
        let capability = newAccount.capabilities
            .account
            .issue<auth(Storage, Contracts, Keys, Inbox, Capabilities) &Account>()

        // Store the account capability in the service account
        signer.storage.save(capability, to: /storage/meteringSettingsAccount)

        // transfer 5 FLOW from the signer account to the new account
        // get the receiver from the new account
        self.tokenReceiver = newAccount.capabilities.borrow<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
            ?? panic("Could not borrow a Receiver reference to the FlowToken Vault in account ")

        // get a reference to the signer's stored vault
        let vaultRef = signer.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)
            ?? panic("The signer does not store a FlowToken Vault object at the path "
                    .concat("/storage/flowTokenVault. ")
                    .concat("The signer must initialize their account with this vault first!"))

        // withdraw tokens from the signer's stored vault
        self.sentVault <- vaultRef.withdraw(amount: 5.0)

        // move metering settings
        newAccount.storage.load<{UInt64: UInt64}>(from: /storage/executionEffortWeights)
        newAccount.storage.save(FlowServiceAccount.getExecutionEffortWeights(), to: /storage/executionEffortWeights)

        newAccount.storage.load<UInt64>(from: /storage/executionMemoryLimit)
        newAccount.storage.save(FlowServiceAccount.getExecutionMemoryLimit(), to: /storage/executionMemoryLimit)

        // there are no memory weights to copy
        // newAccount.storage.load<{UInt64: UInt64}>(from: /storage/executionMemoryWeights)
        // newAccount.storage.save(FlowServiceAccount.getExecutionMemoryWeights(), to: /storage/executionMemoryWeights)
    }

    execute {
        self.tokenReceiver.deposit(from: <-self.sentVault)
    }
}