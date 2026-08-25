# Remove node from the Approved Node Operators ID List

> Aug 24th, 2026

Transaction: [remove_approved_nodes.cdc](../../../../templates/remove_approved_nodes.cdc)

## Results



## Verification

### Before Transaction:

```
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="8f8d77ba98d1606b19fce8f6d35908bfc29ea171c02879162f6755c05e0ca1ee")'

```

### After Transaction:

```shell
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="8f8d77ba98d1606b19fce8f6d35908bfc29ea171c02879162f6755c05e0ca1ee")'
<returns nothing as expected>
```