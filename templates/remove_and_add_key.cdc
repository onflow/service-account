// This transaction removes the key at index keyIndexToRemove and adds the new key publicKeyToAdd
transaction(keyIndexToRemove: Int, publicKeyToAdd: String) {
	prepare(signer: AuthAccount) {
		signer.removePublicKey(keyIndexToRemove)
		signer.addPublicKey(publicKeyToAdd.decodeHex())
	}
}