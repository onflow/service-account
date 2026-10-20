 fun main(): UInt16 {
    let epochAdmin = signer.storage.borrow<&FlowEpoch.Admin>(from: FlowEpoch.adminStoragePath)
            ?? panic("Could not borrow admin from storage path")

    return epochAdmin.numCollectorClusters
}