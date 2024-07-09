// This transaction is needed when updating a protocol contract
// that would require the gas limit to be above the max

transaction(name: String, code: String) {
	prepare(signer: auth(Contracts) &Account, admin: &Account) {
		signer.contracts.update(name: name, code: code.decodeHex())
	}
}