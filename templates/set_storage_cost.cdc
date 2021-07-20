import FlowStorageFees from 0x8c5303eaa26202d6
// This transaction changes the flow storage fees parameters
transaction(storageMegaBytesPerReservedFLOW: UFix64) {
    
    let adminRef: &FlowStorageFees.Administrator
    prepare(acct: AuthAccount) {
        // borrow a reference to the admin object
        self.adminRef = acct.borrow<&FlowStorageFees.Administrator>(from: /storage/storageFeesAdmin)
            ?? panic("Could not borrow reference to storage fees admin")
    }
    execute {
        self.adminRef.setStorageMegaBytesPerReservedFLOW(storageMegaBytesPerReservedFLOW)
    }
}