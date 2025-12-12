# Upgrade FlowTransactionSchedulerUtils

> Dec 12th, 2025

Updating the `FlowTransactionSchedulerUtils` contract by submitting the [update contract](../../../../transactions/update-contract) transaction with the Service account (`e467b9dd11fa00df`) as the payer/authorizer and signed by the service committee.

### Transaction - FlowTransactionSchedulerUtils Upgrade using the Service account `e467b9dd11fa00df`

Used this to generate the contract code arguments:

jq -n --arg name "FlowTransactionScheduler" --arg value "$(xxd -p ./FlowTransactionSchedulerUtils.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowTransactionScheduler.json

Verified using:
```
$ cat arguments-FlowTransactionSchedulerUtils.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowTransactionSchedulerUtils.cdc
(Should produce no difference)
```

### Result:
https://www.flowscan.io/tx/