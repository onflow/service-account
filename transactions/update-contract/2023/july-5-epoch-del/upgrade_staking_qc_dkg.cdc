/// Transaction to upgrade the FlowClusterQC, FlowDKG, and FlowIDTableStaking contracts
/// to enable delegator minimums and use admin object capabilities

transaction(qcCode: String, dkgCode: String, stakingCode: String) {

    prepare(stakingAccount: AuthAccount) {

        stakingAccount.contracts.update__experimental(name: "FlowClusterQC", code: qcCode.decodeHex())

        stakingAccount.contracts.update__experimental(name: "FlowDKG", code: dkgCode.decodeHex())

        stakingAccount.contracts.update__experimental(name: "FlowIDTableStaking", code: stakingCode.decodeHex())
    }
}
 