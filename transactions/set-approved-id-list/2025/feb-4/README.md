# Add T-systems execution node to the approved list of node

> Feb 4th, 2025

Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt:

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 9f264537d1a2e2ab0baad9dbec599d2d8d7817f969a3851572c82a5dffdbbeb7
```

Total count should be 381
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```