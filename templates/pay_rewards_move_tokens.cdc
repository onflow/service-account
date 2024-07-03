import FlowIDTableStaking from 0x8624b52f9ddcd04a
import FlowEpoch from 0x8624b52f9ddcd04a

// This transaction uses a staking admin reference
// to remove insufficiently staked nodes, pay rewards and move tokens between buckets.
//
// It also sets a new token payout for the next epoch

transaction(newPayout: UFix64, nodeList: {String: UFix64}) {

    // Local variable for a reference to the ID Table Admin object
    let adminRef: &FlowIDTableStaking.Admin

    prepare(acct: AuthAccount) {
        self.adminRef = acct.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")
    }

    execute {

        self.adminRef.setNonOperationalNodesList(nodeList)

        self.adminRef.

        let rewardsArray = self.adminRef.calculateRewards()
        self.adminRef.payRewards(rewardsArray)

        self.adminRef.setEpochTokenPayout(newPayout)
    }
}