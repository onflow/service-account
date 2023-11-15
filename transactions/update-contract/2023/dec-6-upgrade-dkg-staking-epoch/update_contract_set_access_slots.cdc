transaction(name: String, code: String) {
	prepare(signer: AuthAccount) {

		signer.save({5:5}, to: /storage/flowStakingOpenNodeSlots)

		signer.contracts.update__experimental(name: name, code: code.decodeHex())
	}
}