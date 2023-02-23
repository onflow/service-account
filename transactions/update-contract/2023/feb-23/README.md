# Update FlowIDTableStaking Contract

> Feb 23, 2023

Upgrade to the FlowIDTableStaking contract as per this [pull request](https://github.com/onflow/flow-core-contracts/pull/350) to fix a bug in the staking contract

## Transaction

[upgrade-set-candidate.cdc](./upgrade-set-candidate.cdc)


| Contract                                     | Arguments                                                                                      | Multisig Link   | Transaction |
|----------------------------------------------|------------------------------------------------------------------------------------------------|-----------------|-------------|
| [FlowIDTableStaking.cdc](./FlowIDTableStaking.cdc)               | [arguments-update-contract-FlowIDTableStaking.json](./arguments-update-contract-FlowIDTableStaking.json) | [Update Contract]() | [Sealed Transaction](https://flowscan.org/transaction/) |



Used this to generate args:

`cat "./FlowIDTableStaking.cdc" | xxd -p -c0 | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-FlowIDTableStaking-mainnet.json | jq '.[] | .value' | xxd -r -p > temp1.txt
$ diff temp1.txt FlowIDTableStaking.cdc
(Should produce no difference)
```

> Tools is unable to generate the link since the argument content is too large. We will have to do this using the old way using `flow cli`

## Dapper Labs Builds

```sh
flow transactions build ./transactions/update-contract/2023/feb-23/upgrade-set-candidate.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2023/feb-23/arguments-update-contract-FlowIDTableStaking-mainnet.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-unsigned.rlp
```

## Josh Signs

```sh
flow transactions sign ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-unsigned.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-1.rlp
```

## Emerson Signs

```sh
flow transactions sign ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-2.rlp
```

## Justin Signs

```sh
flow transactions sign ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-2.rlp \
  --config-path flow-staking.json \
  --signer justin \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2023/feb-23/flow-id-table-staking-contract-upgrade-feb-23-sig-4.rlp
```

## Results

https://flowscan.org/transaction/

