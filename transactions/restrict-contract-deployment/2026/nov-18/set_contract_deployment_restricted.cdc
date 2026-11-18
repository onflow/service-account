transaction(restricted: Bool) {
    prepare(signer: auth(Storage) &Account) {
        signer.storage.load<Bool>(from: /storage/isContractDeploymentRestricted)
        signer.storage.save(restricted, to: /storage/isContractDeploymentRestricted)
    }
}
