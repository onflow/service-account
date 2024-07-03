import FlowEpoch from 0x8624b52f9ddcd04a
import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Resets the epoch from the Epoch Admin resource object stored in the service account
/// This operation ends the staking auction, qc, dkg, creates metadata
/// for a new epoch, calculates rewards for the current epoch, and starts the new epoch

/// It can be run during any epoch phase

transaction(currentEpochCounter: UInt64,
            randomSource: String,
            startView: UInt64,
            stakingEndView: UInt64,
            endView: UInt64) {

    prepare(signer: AuthAccount) {
        let epochAdmin = signer.borrow<&FlowEpoch.Admin>(from: FlowEpoch.adminStoragePath)
            ?? panic("Could not borrow epoch admin from storage path")

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