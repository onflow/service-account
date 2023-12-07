# Update DKG, Staking, and Epoch Contracts

> Dec 7th, 2023

Upgrade to the DKG, Staking, and Epoch contracts from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/379

These include performance changes, small additions to events, and the addition of the automatic access node slots. 

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowIDTableStaking` and set access node slots.

2. Upgrade `FlowEpoch`.

3. Set Epoch timing Config

Used this to generate the contract code arguments:

`cat "./{Filename}.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-{Filename}-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt {Filename}.cdc
(Should produce no difference)
```
___


# Transaction 1

## Transaction 1 Sequence of signing:

Signer: flow-staking
Transaction: [update_contract_set_access_slots.cdc](update_contract_set_access_slots.cdc)
Args: `arguments-update-FlowIDTableStaking.json`

This transaction has to be executed using the old method because the argument payload is too large.

## Vishal Builds

```sh
flow transactions build ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/update_contract_set_access_slots.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/arguments-update-FlowIDTableStaking.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-unsigned.rlp
```

## Josh Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-1.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-2.rlp
```

## Bluesign Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer justin \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-3.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2023/dec-7-upgrade-staking-epoch/flow-id-table-staking-contract-upgrade-dec-7-sig-4.rlp
```

## Results

https://www.flowdiver.io/tx/9747e6e9c2bdd2df05c49b641938e200d21ba1828398ac402cb8ddd6740b8b7c

___

# Transaction 2

## Transaction 2 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/update_contract.cdc`
Args: `arguments-update-FlowEpoch.json`

This transaction can be executed using the web tool and should be done as soon after
the `FlowIDTableStaking` update as possible.

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [update_contract.cdc](../../../../templates/update_contract.cdc) |  | | |


### Results

Successful attempt:
https://www.flowdiver.io/tx/2fda891153c7ff63c7bfc8b14eb6d6a1c06ed3dfd427cd1b406a673c0ef9b37f

___

# Transaction 3

## Transaction 4 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/set_epoch_timing_config.cdc`

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [set_epoch_timing_config.cdc](../../../../templates/set_epoch_timing_config.cdc) |  | | |


### Results

Successful attempt:
https://www.flowdiver.io/tx/6db7feae4b16760f3ea4602db6c4c2504939942fd9ba3cba9d5c6c29d074ce32

___