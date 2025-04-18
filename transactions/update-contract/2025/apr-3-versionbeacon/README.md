# Update NodeVersionBeacon Contract

Upgrade to NodeVersionBeacon@v1.6.0. This is the first step in the Apr 3 2025 Protocol State Version Upgrade Process.

## Transactions

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

```
jq -n --arg name "NodeVersionBeacon" --arg value "$(xxd -p ./NodeVersionBeacon.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]'
```

Verified using:
```
$ cat upgrade-versionbeacon-args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt NodeVersionBeacon.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): NA

Successful attempt: https://www.flowscan.io/tx/36492fbd75b49c1415c7f4f719831b6487076a76fc710e3752c93c1e3feff683

___

