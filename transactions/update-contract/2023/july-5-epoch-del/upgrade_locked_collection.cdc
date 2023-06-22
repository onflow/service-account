/// Transaction to upgrade the LockedTokens and FlowStakingCollection contract
/// to enable delegator minimums

transaction(lockedTokensCode: String, stakingCollectionCode: String) {

    prepare(account: AuthAccount) {

        account.contracts.update__experimental(name: "LockedTokens", code: lockedTokensCode.decodeHex())

        account.contracts.update__experimental(name: "FlowStakingCollection", code: stakingCollectionCode.decodeHex())
    }
}
 