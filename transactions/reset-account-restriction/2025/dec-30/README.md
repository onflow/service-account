## Account un-restriction for Dec-30

Arguments generated using:
python3 remove_restricted.py ../dec-29/arguments.json to_remove.txt -o arguments.json


```shell
$ python3 remove_restricted.py ../dec-29/arguments.json to_remove.txt -o arguments.json
Scanned 1 top-level arguments.
Scanned 1055 entries inside Array arguments.
Removed 6 Address entries.
Wrote: arguments.json
```

Check script output
```shell
jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' ../dec-29/arguments.json \
| sort > /tmp/old_addresses.csv

jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' arguments.json \
| sort > /tmp/new_addresses.csv

comm -23 /tmp/old_addresses.csv /tmp/new_addresses.csv

Should should only 6 entires

0x0ebf23858d5497f6
0x1113980ca45d1d37
0x1e4aa0b87d10b141
0x44fe3d9157770b2d
0x6a7457b796dee457
0x7492e2f9b4acea9a
```
## Result:
Transaction ID: