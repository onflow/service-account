# Update Epoch Contract

> Sep 11th, 2024

Upgrade to the Staking contract from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/448

This includes a bug fix for the staking contract.

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowIDTableStaking`.

Used this to generate the contract code arguments:

`cat "./{Filename}.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-FlowIDTableStaking-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowIDTableStaking.cdc
(Should produce no difference)
```
___


# Transaction 1

## Transaction 1 Sequence of signing:

Signer: flow-staking
Transaction: [update_contract.cdc](../../../../update_contract.cdc)
Args: `arguments-update-contract-FlowIDTableStaking.json`

This transaction has to be executed using the old method because the argument payload is too large.

## Vishal Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2024/sep-11-upgrade-staking/arguments-update-FlowIDTableStaking.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-unsigned.rlp
```

## Josh Signs

```sh
flow transactions sign ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-unsigned.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-1.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-1.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-2.rlp
```

## Kshitij Signs

```sh
flow transactions sign ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-2.rlp \
  --config-path flow-staking.json \
  --signer kshitij \
  --filter payload \
  --save ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-3.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2024/sep-11-upgrade-staking/flow-id-table-staking-contract-upgrade-sep-11-sig-4.rlp
```

### Results

Successful attempt:


___

