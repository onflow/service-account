transaction(name: String, xmlURI: String, code: String) {
	prepare(signer: AuthAccount) {
		signer.save<String>(xmlURI, to: /storage/flowTokenLogoURI)
		signer.contracts.update__experimental(name: name, code: code.decodeHex())
	}
}