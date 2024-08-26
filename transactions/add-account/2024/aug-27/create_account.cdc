import FlowToken from 0x1654653399040a61
import FungibleToken from 0xf233dcee88fe0abe

transaction(publicKeys: [String]) {

	prepare(signer: AuthAccount) {
		let acct = AuthAccount(payer: signer)

		for i, publicKey in publicKeys {
			let key = PublicKey(
				publicKey: publicKey.decodeHex(),
				signatureAlgorithm: SignatureAlgorithm.ECDSA_P256,
			)

			acct.keys.add(
				publicKey: key,
				hashAlgorithm: HashAlgorithm.SHA3_256,
				weight: 1000.0,
			)
		}

		// get the receiver from the new account
        self.tokenReceiver = account
            .getCapability(/public/flowTokenReceiver)!
            .borrow<&{FungibleToken.Receiver}>()
            ?? panic("Unable to borrow receiver reference")

        // get the vault for 100.0 FLOW to fund it with
        let vaultRef = signer.borrow<&FlowToken.Vault>(from: /storage/flowTokenVault)
                ?? panic("Could not borrow reference to the owner's Vault!")

        self.sentVault <- vaultRef.withdraw(amount: 100.0)
	}

    execute {
        self.tokenReceiver.deposit(from: <-self.sentVault)
    }
}
