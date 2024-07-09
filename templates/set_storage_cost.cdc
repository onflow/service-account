import FlowStorageFees from 0xe467b9dd11fa00df
// This transaction changes the flow storage fees parameters
transaction(storageMegaBytesPerReservedFLOW: UFix64) {
    
    let adminRef: &FlowStorageFees.Administrator
    prepare(acct: auth(BorrowValue) &Account) {
        // borrow a reference to the admin object
        self.adminRef = acct.storage.borrow<&FlowStorageFees.Administrator>(from: /storage/storageFeesAdmin)
            ?? panic("Could not borrow reference to storage fees admin")
    }
    execute {
        if storageMegaBytesPerReservedFLOW != nil {
            self.adminRef.setStorageMegaBytesPerReservedFLOW(storageMegaBytesPerReservedFLOW!)
        }
    }
}