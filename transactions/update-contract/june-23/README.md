# Update Service Account Contract

> June 23, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/591c6dcf909c59a72c42cf4bfa9614aa8d4586f4/contracts/FlowServiceAccount.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/june-23/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/june-23/update-contract-june-23-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/june-23/update-contract-june-23-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/june-23/update-contract-june-23-sig-1.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/june-23/update-contract-june-23-sig-1.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/june-23/update-contract-june-23-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/update-contract/june-23/update-contract-june-23-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/update-contract/june-23/update-contract-june-23-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/update-contract/june-23/update-contract-june-23-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/update-contract/june-23/update-contract-june-23-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/june-23/update-contract-june-23-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/c21ab13e9dac38264e3a1070d1070fd08a07f9410b64583d98a56d0ebcfa3a24
