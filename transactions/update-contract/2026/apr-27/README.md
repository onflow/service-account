# Testnet Contract Upgrade

4/27/2026

## Contracts to be upgraded:
1. FlowTransactionScheduler.cdc
2. FlowServiceAccount.cdc
3. FlowIDTableStaking.cdc

## Transaction

[update contract](../../..)

## Args

1. FlowTransactionScheduler

- Update imports

- `cat "./FlowTransactionScheduler.cdc" | xxd -p | tr -d '\n'`


Verified using:
```
$ cat args_for_fts_contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowTransactionScheduler.cdc
(Should produce no difference)
```

2. FlowServiceAccount

- `wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/FlowServiceAccount.cdc`

- Update imports

- `cat "./FlowServiceAccount.cdc" | xxd -p | tr -d '\n'`


Verified using:
```
$ cat args_for_fsa_contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowServiceAccount.cdc
(Should produce no difference)
```

3. FlowIDTableStaking

Used this to generate the contract code arguments:

- Update imports

`cat "./FlowIDTableStaking.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args_for_staking_contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowIDTableStaking.cdc
(Should produce no difference)
```

## Result
1. FlowTransactionScheduler.cdc
2. FlowServiceAccount.cdc
3. FlowIDTableStaking.cdc