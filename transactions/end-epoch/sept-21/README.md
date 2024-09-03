# End Epoch
> September 21st, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v2.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/sept-21/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/sept-21/end-epoch-sept-21-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-21/end-epoch-sept-21-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/sept-21/end-epoch-sept-21-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/b5f214c3284e15b8e13f178582db069350ace98a81e086461da5977050a70962
