import FlowServiceAccount from 0xe467b9dd11fa00df
// This transaction changes the flow transaction fees parameters
transaction(transactionFee: UFix64) {
    let serviceAccountAdmin: &FlowServiceAccount.Administrator
    prepare(signer: AuthAccount) {
        // Borrow reference to FlowServiceAccount Administrator resource.
        //
        self.serviceAccountAdmin = signer.borrow<&FlowServiceAccount.Administrator>(from: /storage/flowServiceAdmin)
            ?? panic("Unable to borrow reference to administrator resource")
    }
    execute {
        // Sets fees
        self.serviceAccountAdmin.setTransactionFee(transactionFee)
    }
}
