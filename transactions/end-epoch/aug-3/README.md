# End Epoch
> August 3rd, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/aug-3/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/aug-3/end-epoch-aug-3-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-3/end-epoch-aug-3-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/aug-3/end-epoch-aug-3-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/d8a85bdd767f56a63bcb627bd74b1fe47f6e0d50b9c19b32c47895ca8373d208
