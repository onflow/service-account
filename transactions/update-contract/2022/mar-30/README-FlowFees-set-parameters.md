# Run Flow Fees parameters

> March 30th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_tx_fee_parameters.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/mar-30/arguments-flow-tx-fee-parameters.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2022/mar-30/set-tx-fee-parameters-mar-30-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
