import FlowEpoch from 0x8624b52f9ddcd04a
import FlowIDTableStaking from 0x8624b52f9ddcd04a

transaction(currentEpochCounter: UInt64,
            randomSource: String,
            startView: UInt64,
            endView: UInt64) {

    prepare(signer: AuthAccount) {
        let epochAdmin = signer.borrow<&FlowEpoch.Admin>(from: FlowEpoch.adminStoragePath)
            ?? panic("Could not borrow epoch admin from storage path")

        epochAdmin.resetEpoch(currentEpochCounter: currentEpochCounter,
                            randomSource: randomSource,
                             startView: startView,
                             endView: endView,
                             collectorClusters: [],
                             clusterQCs: [],
                             dkgPubKeys: [])
    }
}