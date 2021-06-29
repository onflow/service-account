# End Epoch
> June 29, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/june-29/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/june-29/end-epoch-june-29-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/june-29/end-epoch-june-29-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/june-29/end-epoch-june-29-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/june-29/end-epoch-june-29-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/june-29/end-epoch-june-29-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/june-29/end-epoch-june-29-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/june-29/end-epoch-june-29-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/june-29/end-epoch-june-29-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/june-29/end-epoch-june-29-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/june-29/end-epoch-june-29-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/f9cc19931aa131511951ff339dd3c454cdc7d956611cf0271e68c0ed50f6fca2
