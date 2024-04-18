import FlowIDTableStaking from 0x8624b52f9ddcd04a

// This transaction removes a node ID from the current Identity table

transaction(id: String) {

    // Length of the ID Table Node list before the operation
    // Used to verify that the id table was modified correctly
    let lengthBefore: Int

    prepare(acct: AuthAccount) {

        // Load the current identity table from the storage of the staking account
        // This is the only way to modify it without upgrading the staking contract
        var list = acct.load<{String: Bool}>(from: /storage/idTableCurrentList)
            ?? panic("Could not load current node list from storage")

        self.lengthBefore = list.keys.length

        // make sure that the provided ID is a node in the list
        if list[id] == nil {
            panic("Provided ID to remove does not exist in the ID Table")
        }

        let nodeInfo = FlowIDTableStaking.NodeInfo(nodeID: id)
        assert(
            nodeInfo.initialWeight == 0 && nodeInfo.tokensStaked == 0.0,
            message: "The provided node ID should be in the ID table but have a weight and stake of zero"
        )

        // Remove the node ID
        list.remove(key: id)

        // Save the list back to storage
        acct.save<{String: Bool}>(list, to: /storage/idTableCurrentList)
    }

    execute {
        let newlist = FlowIDTableStaking.getParticipantNodeList()
            ?? panic("Could not load the participant node list")

        // Assert that the node has been removed
        assert(
            newlist[id] == nil,
            message: "The node ID was not removed from the ID Table"
        )

        // Assert that only one node was removed
        assert(
            newlist.keys.length == self.lengthBefore - 1,
            message: "Only one node should have been removed from the ID Table"
        )
    }
}