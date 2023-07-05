import FlowEpoch from 0x8624b52f9ddcd04a
import FlowIDTableStaking from 0x8624b52f9ddcd04a

transaction(currentEpochCounter: UInt64,
            randomSource: String,
            startView: UInt64,
            stakingEndView: UInt64,
            endView: UInt64) {

    prepare(signer: AuthAccount) {
        let stakingAdmin = signer.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")

        let epochAdmin = signer.borrow<&FlowEpoch.Admin>(from: FlowEpoch.adminStoragePath)
            ?? panic("Could not borrow heartbeat from storage path")

        stakingAdmin.endStakingAuction()

        epochAdmin.resetEpoch(currentEpochCounter: currentEpochCounter,
                            randomSource: randomSource,
                             startView: startView,
                             stakingEndView: stakingEndView,
                             endView: endView,
                             collectorClusters: [],
                             clusterQCs: [],
                             dkgPubKeys: [])
    }
}
