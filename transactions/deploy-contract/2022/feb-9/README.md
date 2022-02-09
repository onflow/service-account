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
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-unsigned.rlp \
  --config-path flow.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-1.rlp \
  --config-path flow.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-2.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-3.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/deploy-contract/2022/feb-9/flow-contract-audit-contract-deployment-feb-9-sig-complete.rlp
```


## Results

Attempt 1 - Fail - https://flowscan.org/transaction/160a205fa36b82a1b55e4ceccaf1157ad976684d919a1e90e44cd6b0a49cbf7a
Attempt 2 - Susccess - https://flowscan.org/transaction/b1f6b8b5a270277551d8e7112a183d8924cb1f8b5673c2cd44d8532e10c8741d
