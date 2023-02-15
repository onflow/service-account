import FlowIDTableStaking from 0x8624b52f9ddcd04a

// This transaction moves tokens between buckets
// and sets the candidate limit for access nodes to zero

transaction {

    // Local variable for a reference to the ID Table Admin object
    let adminRef: &FlowIDTableStaking.Admin

    prepare(acct: AuthAccount) {
        let adminCapability = acct.copy<Capability>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not get capability from account storage")

        // borrow a reference to the admin object
        self.adminRef = adminCapability.borrow<&FlowIDTableStaking.Admin>()
            ?? panic("Could not borrow reference to staking admin")
    }

    execute {
        self.adminRef.moveTokens()

        self.adminRef.setCandidateNodeLimit(role: UInt8(5), newLimit: UInt64(0))
    }
}