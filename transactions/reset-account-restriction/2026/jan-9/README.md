## Unrestrict accounts for Jan 9th


Number of accounts restricted before the transaction:

```shell
$ flow scripts execute ./get_restricted_list.cdc  -n mainnet -o json | jq '.value|.[]|.value' | wc -l
     335
```
Number of accounts restricted after the transaction should be 335 - 3 = 332

```shell
$ flow scripts execute ./get_restricted_list.cdc  -n mainnet -o json | jq '.value|.[]|.value' | wc -l
     332
```
## Result:
Transaction ID:https://www.flowscan.io/tx/b6fa2c48c073288e704ff3f4e0e839dda4328f0106f3bd337d11f8dca352d2f1