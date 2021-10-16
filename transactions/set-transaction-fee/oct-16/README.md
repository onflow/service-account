# Set Transaction Fee
> October 16, 2021

Sets the transaction fee to 0.00001 FLOW per transaction

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_transaction_fee.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-transaction-fee/oct-16/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/set-transaction-fee/oct-16/set-transaction-fee-oct-16-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/79a0192763156fd3f5ca4910c310384a30b8151638cd7a4d1c58407cc8a9e90c
