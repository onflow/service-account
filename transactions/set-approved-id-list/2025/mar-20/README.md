# Add Flipsde Consenus nodes to the approved list of node

> Mar 20th, 2025

Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt: https://www.flowscan.io/tx/66c83166d544c1270908f320734a9a074753f5bead7eadff85a1b8505888bff6

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 44a020cd512eaa1d1dc3873caadfbffc14142258562d881d3313a3815bf6fc8a
flow scripts execute get_approved_nodes.cdc -n mainnet | grep d772e10b592a6bd22a64102496e9ca706f2b679ffa139b5c878c6c2c2ff2db98

```

Total count should be 357
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```