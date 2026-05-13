# FlowEpoch and FlowTransactionSchedulerUtils contract update

Transactions to upgrade FlowEpoch and FlowTransactionSchedulerUtils contracts

Signer:
1. Staking Account `0x8624b52f9ddcd04a` for FlowEpoch
2. Service Account `0xe467b9dd11fa00df` for FlowTransactionSchedulerUtils

## Transactions

[update contract](../../../../transactions/update-contract)

### FlowEpoch

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/epochs/FlowEpoch.cdc`

- Update imports

`cat "./FlowEpoch.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-flowepoch-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowEpoch.cdc
(Should produce no difference)
```

### FlowTransactionSchedulerUtils

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/FlowTransactionSchedulerUtils.cdc`

- Update imports

`cat "./FlowTransactionSchedulerUtils.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-ftsu-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowTransactionSchedulerUtils.cdc
(Should produce no difference)
```

___

### Results

1. FlowEpoch

2. FlowTransactionSchedulerUtils