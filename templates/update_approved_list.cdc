import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// This transaction adds and removes node IDs from 
/// the list of approved nodes in the ID table.
///
/// The slot limits are increased by the net number of nodes added
///
/// If any of the provided nodes already exist in the ID table, this
/// transaction will not revert (idempotent)

transaction(newApprovedIDs: [String], nodeIDsToRemove: [String]) {

    // Local variable for a reference to the ID Table Admin object
    let adminRef: &FlowIDTableStaking.Admin

    prepare(acct: AuthAccount) {
        // borrow a reference to the admin object
        self.adminRef = acct.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")
    }

    execute {
		let existingApprovedIDs = FlowIDTableStaking.getApprovedList()
			?? panic("Could not load approved list")

		let slotLimits = FlowIDTableStaking.getRoleSlotLimits()

		// add any new node ID which doesn't already exist in the approve list
		// and increase the candidate node limits and slot limits by 1
		// for each corresponding node added
		for newNodeID in newApprovedIDs {
			if existingApprovedIDs[newNodeID] != nil {
    			continue
			}

			let nodeInfo = FlowIDTableStaking.NodeInfo(newNodeID)

			slotLimits[nodeInfo.role] = slotLimits[nodeInfo.role]! + 1

			existingApprovedIDs[newNodeID] = true
		}

		for removedNodeID in nodeIDsToRemove {

			let nodeInfo = FlowIDTableStaking.NodeInfo(removedNodeID)

			slotLimits[nodeInfo.role] = slotLimits[nodeInfo.role]! - 1

			existingApprovedIDs.remove(removedNodeID)
		}

		// set the approved list to the union of existing and new node IDs
        self.adminRef.setApprovedList(existingApprovedIDs)

		// Set new slot limits
		self.adminRef.setSlotLimits(slotLimits: slotLimits)
    }
}