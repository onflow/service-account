# Remove nodes from the Approved Node Operators ID List

## Implementation for [FLIP 367](https://github.com/onflow/flips/pull/368)

> May 13th, 2026

Transaction: [remove_approved_nodes.cdc](../../../../templates/remove_approved_nodes.cdc)

## Results

https://www.flowscan.io/tx/

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