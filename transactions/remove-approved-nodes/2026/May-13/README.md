# Remove nodes from the Approved Node Operators ID List

## Implementation for [FLIP 367](https://github.com/onflow/flips/pull/368)

> May 13th, 2026

Transaction: [remove_approved_nodes.cdc](../../../../templates/remove_approved_nodes.cdc)

## Results

Failed transaction: https://www.flowscan.io/tx/e355fe4e8c96aab02bc65e42220bc25ab460e966cdc105f0f844a7dff7d3d0be?tab=script

Successful transaction: https://www.flowscan.io/tx/2887ef2f221291ec49b996cb26e73f472d55887278212a85ac8e05c3a7f27cb7

## Verification

### Before Transaction:

```
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="3c6519ba8be35e338df7273a895ad3abaeb0c232eb908ee7b05462018c112fe1")'
{
"value": "3c6519ba8be35e338df7273a895ad3abaeb0c232eb908ee7b05462018c112fe1",
"type": "String"
}
```

### After Transaction

```shell
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="3c6519ba8be35e338df7273a895ad3abaeb0c232eb908ee7b05462018c112fe1")'
<returns nothing as expected>
```