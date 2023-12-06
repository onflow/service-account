# Update DKG, Staking, and Epoch Contracts

> Dec 6th, 2023

Upgrade to the DKG, Staking, and Epoch contracts from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/379

These include performance changes, small additions to events, and the addition of the automatic access node slots. 

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowDKG`.

2. Upgrade `FlowIDTableStaking` and set access node slots.

3. Upgrade `FlowEpoch`.

4. Set Epoch timing Config

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
Transaction: `templates/update_contract.cdc`
Args: `arguments-update-FlowDKG.json`

This transaction can be executed using the web tool.

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [update_contract.cdc](../../../../templates/update_contract.cdc) |  | | |


### Results

Successful attempt:
https://www.flowdiver.io/tx/

___

# Transaction 2

## Transaction 2 Sequence of signing:

Signer: flow-staking
Transaction: [update_contract_set_access_slots.cdc](update_contract_set_access_slots.cdc)
Args: `arguments-update-FlowIDTableStaking.json`

This transaction has to be executed using the old method because the argument payload is too large.

## Vishal Builds

```sh
flow transactions build ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/update_contract_set_access_slots.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/arguments-update-FlowIDTableStaking.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-unsigned.rlp
```

## Josh Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-unsigned.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-1.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-1.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-2.rlp
```

## Bluesign Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-2.rlp \
  --config-path flow-staking.json \
  --signer justin \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-3.rlp
```

## Kshitij Signs

```sh
flow transactions sign ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kshitij \
  --filter payload \
  --save ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2023/dec-6-upgrade-dkg-staking-epoch/flow-id-table-staking-contract-upgrade-dec-6-sig-4.rlp
```

## Results

https://www.flowdiver.io/tx/

___

# Transaction 3

## Transaction 3 Sequence of signing: 

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
https://www.flowdiver.io/tx/

___

# Transaction 4

## Transaction 4 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/set_epoch_timing_config.cdc`

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [set_epoch_timing_config.cdc](../../../../templates/set_epoch_timing_config.cdc) |  | | |


### Results

Successful attempt:
https://www.flowdiver.io/tx/

___