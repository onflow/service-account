## Account un-restriction for Jan 1st - Second transaction

Arguments generated using:

```shell
$ python3 remove_restricted.py ../jan-1/arguments.json to_remove.txt -o arguments.json
Scanned 1 top-level arguments.
Scanned 839 entries inside Array arguments.
Removed 235 Address entries.
Wrote: arguments.json
```

Check script output
```shell
jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' ../jan-1/arguments.json \
| sort > /tmp/old_addresses.csv

jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' arguments.json \
| sort > /tmp/new_addresses.csv

comm -23 /tmp/old_addresses.csv /tmp/new_addresses.csv | wc -l

Should only have ?? entires


```
## Result:
Transaction ID: