# Update Flow DKG Contract

> December 7th, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/139e44ddb525636e512992ddaf5245afe4046301/contracts/epochs/FlowDKG.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/dec-7/arguments.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/dec-7/flow-dkg-contract-upgrade-dec-7-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/
