# End Epoch
> June 15, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/june-15/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/june-15/end-epoch-june-15-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/june-15/end-epoch-june-15-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/june-15/end-epoch-june-15-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/june-15/end-epoch-june-15-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/june-15/end-epoch-june-15-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/june-15/end-epoch-june-15-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/june-15/end-epoch-june-15-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/june-15/end-epoch-june-15-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/june-15/end-epoch-june-15-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/june-15/end-epoch-june-15-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/9b86013070876210c5ff04c5518d7698d21be2c3d4525cf985a82b311e7bb217
