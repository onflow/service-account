import FlowIDTableStaking from 0x8624b52f9ddcd04a

transaction(nodeIDToRemove: String, nodeIDToAdd: String) {

    // Local variable for a reference to the ID Table Admin object
    let adminRef: &FlowIDTableStaking.Admin

    prepare(acct: auth(BorrowValue) &Account) {
        // borrow a reference to the admin object
        self.adminRef = acct.storage.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")
    }

    execute {
        let existingApprovedIDs = FlowIDTableStaking.getApprovedList() ?? panic("Could not load approved list")

        // check if the node ID to remove actually exists
	    if existingApprovedIDs[nodeIDToRemove] == nil {
            panic("attempted to remove non-existent node ID from allow-list: ".concat(nodeIDToRemove))
	    }

	    existingApprovedIDs[nodeIDToRemove] = nil

        // check if the node ID to add is not already present
        if existingApprovedIDs[nodeIDToAdd] != nil{
            panic("attempted to add an existing node ID to allow-list: ".concat(nodeIDToAdd))
        }

        existingApprovedIDs[nodeIDToAdd] = true

        self.adminRef.setApprovedList(existingApprovedIDs) // no change to slot count
    }
}
