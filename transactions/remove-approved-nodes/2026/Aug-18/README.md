# Remove node from the Approved Node Operators ID List

> Aug 18th, 2026

Transaction: [remove_approved_nodes.cdc](../../../../templates/remove_approved_nodes.cdc)

## Results



## Verification

### Before Transaction:

```
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="eeaf114cbc49d1c6ed5d061b38c8f8a1743c3433bce384e0598fe505fda55e99")'
{
"value": "eeaf114cbc49d1c6ed5d061b38c8f8a1743c3433bce384e0598fe505fda55e99",
"type": "String"
}
```

### After Transaction:

```shell
$ flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | select(.value=="eeaf114cbc49d1c6ed5d061b38c8f8a1743c3433bce384e0598fe505fda55e99")'
<returns nothing as expected>
```