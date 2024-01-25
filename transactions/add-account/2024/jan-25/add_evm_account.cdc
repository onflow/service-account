import FlowToken from 0x1654653399040a61
import FungibleToken from 0xf233dcee88fe0abe

transaction() {
    let tokenReceiver: &{FungibleToken.Receiver}
    let sentVault: @FungibleToken.Vault

    prepare(signer: AuthAccount) {
        // Create a new account
		let account = AuthAccount(payer: signer)

		// add key to the account
        let key = PublicKey(
            publicKey: "4e005e91a58bd7bedd55cbc4ab96122f1d7102bf8dd3389bce17d1ad2d1f9398fc300cf2bb2d1b17e95fa8bc515cc53ac745a091e6cfa3c3a370cdda7e6fd83a".decodeHex(),
            signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
        )
        account.keys.add(publicKey: key, hashAlgorithm: HashAlgorithm.SHA2_256, weight: 1000.0)

        // get the receiver from the new account
        self.tokenReceiver = account
          .getCapability(/public/flowTokenReceiver)!
          .borrow<&{FungibleToken.Receiver}>()
          ?? panic("Unable to borrow receiver reference")

        // get the vault for 1.0 FLOW to fund it with
        let vaultRef = signer.borrow<&FlowToken.Vault>(from: /storage/flowTokenVault)
            ?? panic("Could not borrow reference to the owner's Vault!")

        self.sentVault <- vaultRef.withdraw(amount: 1.0)
    }

    execute {
        self.tokenReceiver.deposit(from: <-self.sentVault)
    }
}