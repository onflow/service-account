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
Failed Transaction ID: https://www.flowscan.io/tx/1ad8970824ad7ecf77b99c314576bc048df4b52bad7569e4878a191bd6526683
Result: https://www.flowscan.io/tx/f46221941479461f71b240ea2b02f9b6b03cd6c0056c766b8148ae15b9cf52da