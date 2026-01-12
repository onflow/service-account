## Account un-restriction for Jan 12th

Un-restrict all but 4 accounts

Number of accounts restricted before the transaction:

```shell
$ flow scripts execute ./get_restricted_list.cdc  -n mainnet -o json | jq '.value|.[]|.value' | wc -l
     332
```
Number of accounts restricted after the transaction should be 4

```shell
$ flow scripts execute ./get_restricted_list.cdc  -n mainnet -o json | jq '.value|.[]|.value' | wc -l
     ??
```

## Result:
Transaction ID: