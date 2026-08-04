# Upgrade FlowTransactionScheduler

> Aug 4th, 2026

Updating the `FlowTransactionScheduler` contract by submitting the [update contract](../../../../transactions/update-contract) transaction with the Service account (`e467b9dd11fa00df`) as the payer/authorizer and signed by the service committee.

Issue: [service-account#463](https://github.com/onflow/service-account/issues/463)

The change is described in [flow-core-contracts-internal#7](https://github.com/onflow/flow-core-contracts-internal/pull/7).

### Transaction - FlowTransactionScheduler Upgrade using the Service account `e467b9dd11fa00df`

The contract source is `contracts/FlowTransactionScheduler.cdc` from `flow-core-contracts-internal` `main`, with the imports updated to mainnet addresses.

Used this to generate the contract code arguments:

```
jq -n --arg name "FlowTransactionScheduler" --arg value "$(xxd -p ./FlowTransactionScheduler.cdc | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowTransactionScheduler.json
```

Verified using:
```
$ cat arguments-FlowTransactionScheduler.json | jq -r '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowTransactionScheduler.cdc
(Should produce no difference)
```

Also verified that the file differs from the currently deployed mainnet contract only by the intended change:
```
$ flow accounts get 0xe467b9dd11fa00df --network mainnet --include contracts -o json \
    | jq -r '.code.FlowTransactionScheduler' > /tmp/onchain.cdc
$ diff /tmp/onchain.cdc FlowTransactionScheduler.cdc
```

### Result:
Transaction ID: https://www.flowscan.io/tx/22416d410b897a38b57350262c8293b77f9a34ad3d9af1eaf730277109c74c1e
