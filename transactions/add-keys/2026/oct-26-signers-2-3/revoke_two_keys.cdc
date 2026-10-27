transaction(keyIndex1ToRevoke: Int, keyIndex2ToRevoke: Int) {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: keyIndex1ToRevoke)
        signer.keys.revoke(keyIndex: keyIndex2ToRevoke)
    }
}
