import FlowIDTableStaking from 0x8624b52f9ddcd04a
import FlowEpoch from 0x8624b52f9ddcd04a

// This transaction uses a staking admin capability
// to pay rewards for the previous epoch using the stored reward amounts
// from the previous epoch's metadata
//
// It also sets a new token payout for the next epoch

transaction(newPayout: UFix64) {

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

        let totalPayout = FlowIDTableStaking.getEpochTokenPayout()

        if let previousEpochMetadata = FlowEpoch.getEpochMetadata(FlowEpoch.currentEpochCounter - (1 as UInt64)) {
            assert(
                previousEpochMetadata.counter == UInt64(72),
                message: "Previous Epoch counter is incorrect"
            )
            let summary = FlowIDTableStaking.EpochRewardsSummary(totalRewards: totalPayout, breakdown: previousEpochMetadata.rewardAmounts)
            self.adminRef.payRewards(summary)
        }

        self.adminRef.setEpochTokenPayout(newPayout)
    }
}