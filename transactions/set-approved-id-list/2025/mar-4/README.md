# Add Dorahack Consenus nodes to the approved list of node

> Mar 4th, 2025

Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt: https://www.flowscan.io/tx/f0611e0da4dca930dcdcc025ccf5f2945a4bfc84a53b749d46e01f4509d2abe6

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep babcdd6cbb72a26c8470fea1090af31e9b419b331d7bda0496e28134b698d70a
flow scripts execute get_approved_nodes.cdc -n mainnet | grep bf0629b59694a3403c88e05e6e290983e8d9faff7593089f6a1ab0f670b5d9b1
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 0232d16ec0499215ba981b13d0acca886da6dbb23e76d6c272756380cc9b4e27

```

Total count should be 384
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```