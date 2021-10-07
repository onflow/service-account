import FlowIDTableStaking from 0x8624b52f9ddcd04a

// This transaction sets the list of approved nodes in the ID table

transaction {

    // Local variable for a reference to the ID Table Admin object
    let adminRef: &FlowIDTableStaking.Admin

    prepare(acct: AuthAccount) {
        // borrow a reference to the admin object
        self.adminRef = acct.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")
    }

    execute {
        let nodeList: {String: UFix64} = {}
        self.adminRef.setApprovedList(ids)
    }
}
