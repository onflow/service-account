# End Epoch
> August 10th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/aug-10/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/aug-10/end-epoch-aug-10-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-10/end-epoch-aug-10-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/aug-10/end-epoch-aug-10-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/80366137eb2665d52480b6d9592decb11c98dcb38657633673173503d94db711
