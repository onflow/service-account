# Add Dorahack Consenus node to the approved list of node

> Feb 25th, 2025

Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt: https://www.flowscan.io/tx/

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 30f193fa5829e58454c0eb9ae0f2c9aae98cf4445b9b782d928c78b4589e1d58
```

Total count should be 381
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```