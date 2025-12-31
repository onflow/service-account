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
https://www.flowscan.io/tx/49904bf75cbf5f96f925b8d3d81d89a9af778afe378f7e586d19c45b6d6aa714

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

https://www.flowscan.io/tx/83a8df8d43b519e598ac9b0b1df2cb57164b5e6f14e9e66ed188d27aeff0276e

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

Failed: https://www.flowscan.io/tx/5fe79b7a11650c8eb21161d24f707e91fe88e5490d510365cb52061f6df8de23?tab=script

https://www.flowscan.io/tx/9cc90b203d564ea182f2cb7480b287a282b3fef15c7b98c661e88015fbff42a8