import Crypto

transaction(
	key1: String, key1SignatureAlgorithm: UInt8, key1HashAlgorithm: UInt8, key1Weight: UFix64,
	key2: String, key2SignatureAlgorithm: UInt8, key2HashAlgorithm: UInt8, key2Weight: UFix64
) {

	prepare(signer: auth(AddKey) &Account) {
		pre {
			key1SignatureAlgorithm >= 1 && key1SignatureAlgorithm <= 3: "Must provide a signature algorithm raw value that is 1, 2, or 3"
			key1HashAlgorithm >= 1 && key1HashAlgorithm <= 6: "Must provide a hash algorithm raw value that is between 1 and 6"
			key1Weight <= 1000.0: "The key weight must be between 0 and 1000"
			key2SignatureAlgorithm >= 1 && key2SignatureAlgorithm <= 3: "Must provide a signature algorithm raw value that is 1, 2, or 3"
			key2HashAlgorithm >= 1 && key2HashAlgorithm <= 6: "Must provide a hash algorithm raw value that is between 1 and 6"
			key2Weight <= 1000.0: "The key weight must be between 0 and 1000"
		}

		let publicKey1 = PublicKey(
			publicKey: key1.decodeHex(),
			signatureAlgorithm: SignatureAlgorithm(rawValue: key1SignatureAlgorithm)!
		)
		signer.keys.add(publicKey: publicKey1, hashAlgorithm: HashAlgorithm(rawValue: key1HashAlgorithm)!, weight: key1Weight)

		let publicKey2 = PublicKey(
			publicKey: key2.decodeHex(),
			signatureAlgorithm: SignatureAlgorithm(rawValue: key2SignatureAlgorithm)!
		)
		signer.keys.add(publicKey: publicKey2, hashAlgorithm: HashAlgorithm(rawValue: key2HashAlgorithm)!, weight: key2Weight)
	}
}
