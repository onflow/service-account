import FlowEpoch from 0x8624b52f9ddcd04a

transaction {
	prepare(signer: AuthAccount) {

		// Initialize the EpochTimingConfig in storage
		let config = FlowEpoch.EpochTimingConfig(
			duration: 604800, // 1 week in seconds
			refCounter: 101, // the epoch ended Wed Nov 15 @ 19:00UTC
			refTimestamp: 1700074800) // Unix timestamp for Wed Nov 15 @ 19:00UTC

		signer.save(config, to: /storage/flowEpochTimingConfig)
	}
}