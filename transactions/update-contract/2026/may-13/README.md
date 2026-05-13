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

1. FlowEpoch: https://www.flowscan.io/tx/fdc3d19afa1dfa4391b3317c2a040e1533e8b9531efc3661ab33712d99d777d9

2. FlowTransactionSchedulerUtils: https://www.flowscan.io/tx/1ba49d2bd2de52552a86df718788012ce7a89251113d096c51c8eea48fe42957