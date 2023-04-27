import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// This transaction uses a staking admin capability
/// to set a list of nodes whose rewards will be decreased
/// during the next rewards payout

transaction(nodesToSlash: {String: UFix64}) {

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
        self.adminRef.setNonOperationalNodesList(nodesToSlash)
    }
}