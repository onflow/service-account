# Remove a decommissioned node from the Node Operators ID Table

> April 24th, 2024

Removing an old node ID that was not removed properly when it unstaked.

`a3fac321587b4835966946cf7a13d5feaeb7ca91a84c85c2d2f861c2d80513ec`

The `FlowIDTableStaking` contract was upgraded to have functionality to remove nodes
from the approve list when they unstaked and also to unstaked and remove nodes 
from the IDTable if they were removed from the approve list. 
Because the upgrade was performed while this node was still approved but unstaked,
it never went through the process of getting automatically removed from the approve list
when it unstaked like nodes normally would. Therefore, it remains in the current
list even though its stake is zero and its weight is zero.

This transaction directly modifies the id table to remove the decommissioned node.
The transaction contains proper checks to make sure only the provided node
with zero weight is removed.

The transaction must be authorized and signed with the staking account
because it interacts with the staking account's storage.

From now on, everything should be fine for cases where approved nodes unstaked.

## Method using Multisign tool

1. FF generates the Signature Request ID on the [site]() for the `remove_node_from_id_table.cdc` transaction signed by the staking account with the given args.

2. Service account members sign and submit the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

https://www.flowdiver.io/tx/
