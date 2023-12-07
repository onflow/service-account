transaction(name: String, code: String) {
	prepare(signer: AuthAccount) {

		let slots: {UInt8: UInt16} = {5:3}
		signer.save(slots, to: /storage/flowStakingOpenNodeSlots)

		signer.contracts.update__experimental(name: name, code: code.decodeHex())
	}
}