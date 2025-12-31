# Upgrade EVM and FlowServiceAccount

> Dec 31st, 2025

Updating the `EVM` and `FlowServiceAccount` contracts by submitting the [update contract](../../../../transactions/update-contract) transaction with the Service account (`e467b9dd11fa00df`) as the payer/authorizer and signed by the service committee.

### Transaction - `EVM` Upgrade using the Service account `e467b9dd11fa00df`

Used this to generate the contract code arguments:

jq -n --arg name "EVM" --arg value "$(xxd -p ./EVM.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-EVM.json

Verified using:
```
$ cat arguments-EVM.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt EVM.cdc
(Should produce no difference)
```

### Result:
https://www.flowscan.io/tx/

### Transaction - `FlowServiceAccount` Upgrade using the Service account `e467b9dd11fa00df`

Used this to generate the contract code arguments:

jq -n --arg name "FlowServiceAccount" --arg value "$(xxd -p ./FlowServiceAccount.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowServiceAccount.json

Verified using:
```
$ cat arguments-FlowServiceAccount.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowServiceAccount.cdc
(Should produce no difference)
```

### Result:
https://www.flowscan.io/tx/


### Transaction - `RetrieveFraudulentTokensEvents` Deployment using the Service account `e467b9dd11fa00df`
and the [deploy contract transaction](../../../../templates/deploy_contract.cdc).

Used this to generate the contract code arguments:

jq -n --arg name "RetrieveFraudulentTokensEvents" --arg value "$(xxd -p ./RetrieveFraudulentTokensEvents.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-RetrieveFraudulentTokensEvents.json

Verified using:
```
$ cat arguments-RetrieveFraudulentTokensEvents.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt RetrieveFraudulentTokensEvents.cdc
(Should produce no difference)
```

### Result:
https://www.flowscan.io/tx/