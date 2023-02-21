import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Transaction to upgrade the FlowIDTableStaking contract
/// to fix a bug with candidate access nodes

transaction(code: String) {

    prepare(stakingAccount: AuthAccount) {

        // Borrow the admin to set minimum stake requirement for access nodes
        let adminRef = stakingAccount.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")

        adminRef.setCandidateNodeLimit(role: UInt8(5), newLimit: UInt64(1000))

        stakingAccount.contracts.update__experimental(name: "FlowIDTableStaking", code: code.decodeHex())

    }
}
