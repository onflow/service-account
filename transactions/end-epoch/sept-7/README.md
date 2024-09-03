# End Epoch
> September 7th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v2.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/sept-7/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/sept-7/end-epoch-sept-7-unsigned.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-7/end-epoch-sept-7-unsigned.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-1.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-1.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/sept-7/end-epoch-sept-7-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/4bd3dc0284bfd077eb5eac7d39afd01df3e8125c45b07e2d3ea7e7e8512e09ef
