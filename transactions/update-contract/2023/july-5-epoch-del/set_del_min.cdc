import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Transaction to set delegator minimums to 50 FLOW

transaction() {

    prepare(stakingAccount: AuthAccount) {

        let stakingAdmin = stakingAccount.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")

        stakingAdmin.setDelegatorMinimumStakeRequirement(50.0)
    }
}
 