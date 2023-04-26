import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Transaction to upgrade the FlowEpoch contract
/// and enable automatic staking rewards

transaction(bonusTokenAmount: UFix64, code: String) {

    prepare(stakingAccount: AuthAccount) {

        // Borrow the admin to set minimum stake requirement for access nodes
        let adminRef = stakingAccount.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")

        adminRef.updateAutomaticRewardsEnabled(true)

        stakingAccount.load<UFix64>(from: /storage/FlowBonusTokenAmount)
        stakingAccount.save(bonusTokenAmount, to: /storage/FlowBonusTokenAmount)
        
        stakingAccount.contracts.update__experimental(name: "FlowEpoch", code: code.decodeHex())
    }
}
