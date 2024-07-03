transaction(restricted: Bool) {
    prepare(signer: AuthAccount) {
	    signer.load<Bool>(from: /storage/isContractDeploymentRestricted)
	    signer.save(restricted, to: /storage/isContractDeploymentRestricted)
    }
}
