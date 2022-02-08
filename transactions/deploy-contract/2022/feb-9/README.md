# Deploy Flow Contract Audits Contract

> February 9th, 2022

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/d123d87038373abe9cd023a1217188fdf94902aa/contracts/FlowContractAudits.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/deploy_contract.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/deploy-contract/2022/feb-9/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 0 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-unsigned.rlp \
  --config-path flow.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-1.rlp \
  --config-path flow.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-2.rlp \
  --config-path flow.json \
  --signer layne \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-3.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/deploy-contract/2022/feb-9/flow-dkg-contract-upgrade-feb-9-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/
