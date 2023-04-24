import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Transaction to upgrade the FlowEpoch contract
/// and enable automatic staking rewards

transaction(code: String) {

    prepare(stakingAccount: AuthAccount) {

        // Borrow the admin to set minimum stake requirement for access nodes
        let adminRef = stakingAccount.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")

        adminRef.updateAutomaticRewardsEnabled(true)
        
        stakingAccount.contracts.update__experimental(name: "FlowEpoch", code: code.decodeHex())
    }
}
