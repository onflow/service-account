# Remove node from the Approved Node Operators ID List

> June 4th, 2026

Transaction: [remove_approved_nodes.cdc](../../../../templates/remove_approved_nodes.cdc)

## Results



## Verification

### Before Transaction:

```
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="6944b7968594f277c4c051d83ced4bab6ed87ed992d831f31ffb6a7b5926e298")'
{
"value": "6944b7968594f277c4c051d83ced4bab6ed87ed992d831f31ffb6a7b5926e298",
"type": "String"
}
```

### After Transaction

```shell
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="3c6519ba8be35e338df7273a895ad3abaeb0c232eb908ee7b05462018c112fe1")'
<returns nothing as expected>
```