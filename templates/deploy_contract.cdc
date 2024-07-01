transaction(name: String, code: String) {
	prepare(signer: auth(Contracts) &Account) {
		signer.contracts.add(name: name, code: code.decodeHex())
	}
}