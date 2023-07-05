/// Transaction to upgrade the FlowStakingCollection contract
/// to enable delegator minimums

transaction(stakingCollectionCode: String) {

    prepare(account: AuthAccount) {

        account.contracts.update__experimental(name: "FlowStakingCollection", code: stakingCollectionCode.decodeHex())
    }
}
 