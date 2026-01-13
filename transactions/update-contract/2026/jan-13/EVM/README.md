# Update EVM Contract

Upgrade the EVM contract to the latest in flow-go that reorganizes code and adds more documentation.

## Transactions

[update contract](../../..)

- Update imports

`cat "./contract.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
cat args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
diff /tmp/temp.txt contract.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): 

Successful attempt:https://www.flowscan.io/tx/146aaa2620bc1e003a241e8200939c1f96f39e99e4e1d276e8a7b15cc9cadcca?tab=events

___

