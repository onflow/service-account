import FlowIDTableStaking from 0x9eca2b38b18b5dfe

// This script gets all the info about a node and returns it

access(all) fun main(nodeID: String): FlowIDTableStaking.NodeInfo {
    return FlowIDTableStaking.NodeInfo(nodeID: nodeID)
}
