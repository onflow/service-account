## Account un-restriction for Jan 5th

Arguments generated using:

```shell
$ python3 remove_restricted.py ../jan-2/arguments.json to_remove.txt -o arguments.json
Scanned 1 top-level arguments.
Scanned 604 entries inside Array arguments.
Removed 269 Address entries.
Wrote: arguments.json
```

Check script output
```shell
jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' ../jan-2/arguments.json \
| sort > /tmp/old_addresses.csv

jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' arguments.json \
| sort > /tmp/new_addresses.csv

comm -23 /tmp/old_addresses.csv /tmp/new_addresses.csv | wc -l

Should only have 269 entires


```
## Result:
Transaction ID:https://www.flowscan.io/tx/90991eb4014ce82cb19fad9d727b435ed948589b344a6311a5c029271ed4bf9d