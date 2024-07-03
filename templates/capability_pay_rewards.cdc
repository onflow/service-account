import FlowIDTableStaking from 0x8624b52f9ddcd04a

// This transaction used Cadence 0.42 and is no longer compatible
// with the current version of Cadence on testnet and mainnet

// This transaction uses a staking admin capability
// to pay rewards.
//
// It also sets a new token payout for the next epoch

transaction(newPayout: UFix64, nodeList: {String: UFix64}) {

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

        self.adminRef.setNonOperationalNodesList(nodeList)

        let rewardsArray = self.adminRef.calculateRewards()
        self.adminRef.payRewards(rewardsArray)

        self.adminRef.setEpochTokenPayout(newPayout)
    }
}