# Update Service Account Contract

> August 3, 2022

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/master/contracts/FlowToken.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/aug-3/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/aug-3/update-contract-aug-3-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/aug-3/update-contract-aug-3-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/aug-3/update-contract-aug-3-sig-1.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/aug-3/update-contract-aug-3-sig-1.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/aug-3/update-contract-aug-3-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/update-contract/aug-3/update-contract-aug-3-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/update-contract/aug-3/update-contract-aug-3-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/update-contract/aug-3/update-contract-aug-3-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/update-contract/aug-3/update-contract-aug-3-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/aug-3/update-contract-aug-3-sig-complete.rlp
```

## Results

