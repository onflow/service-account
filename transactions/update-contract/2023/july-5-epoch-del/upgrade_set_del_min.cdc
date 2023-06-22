import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Transaction to upgrade the FlowClusterQC, FlowDKG, and FlowIDTableStaking contracts
/// to enable delegator minimums and use admin object capabilities

transaction(delegatorMin: UFix64, qcCode: String, dkgCode: String, stakingCode: String) {

    prepare(stakingAccount: AuthAccount) {

        stakingAccount.contracts.update__experimental(name: "FlowClusterQC", code: qcCode.decodeHex())

        stakingAccount.contracts.update__experimental(name: "FlowDKG", code: dkgCode.decodeHex())

        stakingAccount.contracts.update__experimental(name: "FlowIDTableStaking", code: stakingCode.decodeHex())

        let stakingAdmin = stakingAccount.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")

        stakingAdmin.setDelegatorMinimumStakeRequirement(delegatorMin)
    }
}
 