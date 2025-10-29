# Upgrade FlowTransactionScheduler config init

> Oct 29th, 2025

Updating the `FlowTransactionScheduler` contract by submitting the [update contract](../../../../transactions/update-contract) transaction with the Service account (`e467b9dd11fa00df`) as the payer and signed by the service committee.

### Transaction - FlowTransactionScheduler Upgrade using the Service account `e467b9dd11fa00df`

Used this to generate the contract code arguments:

jq -n --arg name "FlowTransactionScheduler" --arg value "$(xxd -p ./FlowTransactionScheduler.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowTransactionScheduler.json

Verified using:
```
$ cat arguments-FlowTransactionScheduler.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowTransactionScheduler.cdc
(Should produce no difference)
```

### Result:
https://www.flowscan.io/tx/077522dd3aabe1fe9f98960a9c66433fce0aef2cb0a253b2841ae3df4b256b2a