# End Epoch
> August 17th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/aug-17/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/aug-17/end-epoch-aug-17-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-17/end-epoch-aug-17-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/aug-17/end-epoch-aug-17-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/38364caf7310ebac175d40fe99b9e3ac636eb0d370e9f647f92bb3fe938915ff
