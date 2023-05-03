import FlowIDTableStaking from 0x8624b52f9ddcd04a
import FlowEpoch from 0x8624b52f9ddcd04a

/// Transaction to upgrade the FlowEpoch contract
/// and enable automatic staking rewards

transaction(bonusTokenAmount: UFix64, code: String) {

    prepare(stakingAccount: AuthAccount) {

        let epochAdmin = stakingAccount.borrow<&FlowEpoch.Admin>(from: FlowEpoch.adminStoragePath)
            ?? panic("Could not borrow admin from storage path")

        epochAdmin.updateAutomaticRewardsEnabled(true)

        stakingAccount.load<UFix64>(from: /storage/FlowBonusTokenAmount)
        stakingAccount.save(bonusTokenAmount, to: /storage/FlowBonusTokenAmount)
        
        stakingAccount.contracts.update__experimental(name: "FlowEpoch", code: code.decodeHex())
    }
}
