transaction(oldKeyIndex: Int, publicKey: String) {
	prepare(signer: AuthAccount) {
		signer.removePublicKey(oldKeyIndex)
		signer.addPublicKey(publicKey.decodeHex())
	}
}