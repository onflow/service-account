# End Epoch
> August 31st, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v2.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/aug-31/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/aug-31/end-epoch-aug-31-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-31/end-epoch-aug-31-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/aug-31/end-epoch-aug-31-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/109838b1910c72484e2789b5e60cfbab2e2a75da354b5e378397dae72f97e73e
