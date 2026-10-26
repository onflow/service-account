transaction(keyIndexToRevoke: Int) {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: keyIndexToRevoke)
    }
}
