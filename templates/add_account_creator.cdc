import FlowServiceAccount from 0xe467b9dd11fa00df
transaction(addresses: [Address]) {
    let serviceAccountAdmin: &FlowServiceAccount.Administrator
    prepare(signer: AuthAccount) {
        // Borrow reference to FlowServiceAccount Administrator resource.
        //
        self.serviceAccountAdmin = signer.borrow<&FlowServiceAccount.Administrator>(from: /storage/flowServiceAdmin)
            ?? panic("Unable to borrow reference to administrator resource")
    }
    execute {
        // Add all addresses to account creator list
        for address in addresses {
            self.serviceAccountAdmin.addAccountCreator(address)
        }
    }
}
