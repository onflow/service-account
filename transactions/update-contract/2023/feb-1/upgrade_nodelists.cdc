import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Transaction to upgrade the FlowIDTableStaking contract
/// to include performance improvements
/// and support permissionless node operation for access nodes
/// This transaction needs to be sent during the epoch setup
/// or epoch commit phase, because it initializes important
/// storage paths that are used to store fields
/// in the contract to track candidate nodes, staking slots,
/// limits, and more

transaction(slotLimits: {UInt8: UInt16}, code: String) {

    prepare(stakingAccount: AuthAccount) {

        // Initialize Candidate Node List
        let emptyCandidateNodes: {UInt8: {String: Bool}} = {1: {}, 2: {}, 3: {}, 4: {}, 5: {}}
        stakingAccount.save(emptyCandidateNodes, to: /storage/idTableCandidateNodes)

        // Save Staking Slot Limits to storage
        stakingAccount.save(slotLimits, to: /storage/flowStakingSlotLimits)

        // Initialize the Moves pending list
        // For the first epoch, we just set all nodes and delegators as pending
        // Even though they are set, the moveTokens method will stil skip them
        let movesPendingList: {String: {UInt32: Bool}} = {}
        let nodeIDs = FlowIDTableStaking.getNodeIDs()
        for nodeID in nodeIDs {
            let nodeInfo = FlowIDTableStaking.NodeInfo(nodeID: nodeID)

            let delegatorPendingMoves: {UInt32: Bool} = {}
            for delegator in nodeInfo.delegators {
                delegatorPendingMoves[delegator] = true
            }

            movesPendingList[nodeID] = delegatorPendingMoves
        }
        stakingAccount.save<{String: {UInt32: Bool}}>(movesPendingList, to: /storage/idTableMovesPendingList)

        // Initialize the candidate Node Limits List
        // Currently, only access nodes are allowed as candidate nodes
        // because the other node roles are approval only
        let candidateNodeLimits: {UInt8: UInt64} = {1: 0, 2: 0, 3: 0, 4: 0, 5: 1000}
        stakingAccount.save<{UInt8: UInt64}>(candidateNodeLimits, to: /storage/idTableCandidateNodeLimits)

        // Borrow the admin to set minimum stake requirement for access nodes
        let adminRef = stakingAccount.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")
        
        // Set Access node minimum stake requirement to 100 FLOW
        let minimums: {UInt8: UFix64} = FlowIDTableStaking.getMinimumStakeRequirements()
        minimums[5] = 100.0
        adminRef.setMinimumStakeRequirements(minimums)

        // Approve List needs to be changed from [String] to {String: Bool}
        let approveList: [String] = stakingAccount.load<[String]>(from: /storage/idTableApproveList)
            ?? panic("Could not load the approve list from storage")

        // Create the approve list dictionary with the loaded value, then store the dictionary in the same path
        var approveDict: {String: Bool} = {}
        for nodeID in approveList {
            approveDict[nodeID] = true
        }

        stakingAccount.save<{String: Bool}>(approveDict, to: /storage/idTableApproveList)

        // Participant Node list needs to be changed from [String] to {String: Bool}
        let participantList: [String] = stakingAccount.load<[String]>(from: /storage/idTableCurrentList)
            ?? panic("Could not load the participant list from storage")

        let roleCounts: {UInt8: UInt16} = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0}

        // Create the participant dictionary with the loaded value, then store the dictionary in the same path
        var participantDict: {String: Bool} = {}
        for nodeID in participantList {
            participantDict[nodeID] = true

            let nodeInfo = FlowIDTableStaking.NodeInfo(id: nodeID)
            roleCounts[nodeInfo.role] = roleCounts[nodeInfo.role]! + 1
        }

        stakingAccount.save<{String: Bool}>(participantDict, to: /storage/idTableCurrentList)

        // Initialize the Staking Slot Counts
        // `getCurrentRoleNodeCounts` calculates the counts based on the current list
        // so we just store the result in storage after calculating
        stakingAccount.save(roleCounts, to: /storage/flowStakingRoleNodeCounts)
    
        stakingAccount.contracts.update__experimental(name: "FlowIDTableStaking", code: code.decodeHex())

    }
}
