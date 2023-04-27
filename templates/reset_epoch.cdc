import FlowEpoch from 0x8624b52f9ddcd04a
import FlowIDTableStaking from 0x8624b52f9ddcd04a

transaction(currentEpochCounter: UInt64,
            randomSource: String,
            startView: UInt64,
            endView: UInt64) {

    prepare(signer: AuthAccount) {
        let heartbeat = signer.borrow<&FlowEpoch.Heartbeat>(from: FlowEpoch.heartbeatStoragePath)
            ?? panic("Could not borrow heartbeat from storage path")

        heartbeat.resetEpoch(currentEpochCounter: currentEpochCounter,
                            randomSource: randomSource,
                             startView: startView,
                             endView: endView,
                             collectorClusters: [],
                             clusterQCs: [],
                             dkgPubKeys: [])
    }
}