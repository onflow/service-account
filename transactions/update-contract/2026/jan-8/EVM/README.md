# Update EVM Contract

Upgrade the EVM contract

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

Successful attempt:https://www.flowscan.io/tx/613171cfe8abe0b70a3a8507adcefa9fbd1908b2fe55ab2cb912cd5166b681ee

___

