import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Transaction to set delegator minimums to 50 FLOW
/// and set moves pending for all staked delegators who are below the minimum
/// so that they will be unstaked

transaction() {

    prepare(stakingAccount: AuthAccount) {

        let stakingAdmin = stakingAccount.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")

        stakingAdmin.setDelegatorMinimumStakeRequirement(50.0)

        let oldMovesPendingList = stakingAccount.load<{String: {UInt32: Bool}}>
            (from: /storage/idTableMovesPendingList)
            ?? panic("Could not load old moves pending list")

        let nodeIDs = FlowIDTableStaking.getStakedNodeIDs()

        for nodeID in nodeIDs {
            let nodeInfo = FlowIDTableStaking.NodeInfo(nodeID: nodeID)

            let delegatorPendingMoves: {UInt32: Bool} = oldMovesPendingList[nodeID] ?? {}
            for delegator in nodeInfo.delegators {
                let delegatorInfo = FlowIDTableStaking.DelegatorInfo(nodeID: nodeID, delegatorID: delegator)

                let actualCommittedForNextEpoch = delegatorInfo.tokensCommitted + delegatorInfo.tokensStaked - delegatorInfo.tokensRequestedToUnstake
                
                if actualCommittedForNextEpoch < FlowIDTableStaking.getDelegatorMinimumStakeRequirement() {
                    delegatorPendingMoves[delegator] = true
                }
            }

            oldMovesPendingList[nodeID] = delegatorPendingMoves
        }
        
        stakingAccount.save<{String: {UInt32: Bool}}>(oldMovesPendingList, to: /storage/idTableMovesPendingList)
    }
}
 