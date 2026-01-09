## Unrestrict accounts for Jan 9th


Number of accounts restricted before the transaction:

```shell
$ flow scripts execute ./get_restricted_list.cdc  -n mainnet -o json | jq '.value|.[]|.value' | wc -l
     335
```
Number of accounts restricted after the transaction should be 335 - 3 = 332

```shell
$ flow scripts execute ./get_restricted_list.cdc  -n mainnet -o json | jq '.value|.[]|.value' | wc -l
     Should be 332
```
## Result:
Transaction ID: