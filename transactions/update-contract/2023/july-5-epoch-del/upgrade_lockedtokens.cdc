/// Transaction to upgrade the LockedTokens contract
/// to enable delegator minimums

transaction(lockedTokensCode: String) {

    prepare(account: AuthAccount) {

        account.contracts.update__experimental(name: "LockedTokens", code: lockedTokensCode.decodeHex())
    }
}
 