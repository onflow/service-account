import FlowEpoch from 0x8624b52f9ddcd04a

transaction(dkgPhaseLen: UInt64, stakingLen: UInt64, epochLen: UInt64) {
    prepare(signer: AuthAccount) {
        let epochAdmin = signer.borrow<&FlowEpoch.Admin>(from: FlowEpoch.adminStoragePath)
            ?? panic("Could not borrow admin from storage path")

				// The contract does not allow an inconsistent configuration, so 
        epochAdmin.updateDKGPhaseViews(dkgPhaseLen)
        epochAdmin.updateEpochViews(epochLen)
				epochAdmin.updateAuctionViews(stakingLen)
    }
}