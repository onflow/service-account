# Replace the old node ID for T-systems execution node with the new ID

> Feb 4th, 2025

Transaction: [replace_approved_node_id](./replace_approved_node_id.cdc)

## Results

Successful attempt:

## Verification

The following should yield no output
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc | grep 2b396b7fab0102f104a2af7e095b145cc14da28f863564802e158afc3e07e638
```

The following should find the node
```shell
flow scripts execute get_approved_nodes.cdc | grep 9f264537d1a2e2ab0baad9dbec599d2d8d7817f969a3851572c82a5dffdbbeb7
```