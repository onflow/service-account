# Update Flow DKG Contract

> February 9th, 2022

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/e2f28762f87896428ffb1f385296c3a3c286852d/contracts/epochs/FlowDKG.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/feb-9/arguments-flow-dkg.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/2dab42bf0ef7b364b24e236411d4f53c33dcf993a127705d2652a761570dd835
