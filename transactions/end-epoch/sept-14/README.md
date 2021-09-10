# End Epoch
> September 14th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v2.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/sept-14/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/sept-14/end-epoch-sept-14-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-14/end-epoch-sept-14-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-2.rlp \
  --signer Peter \
  --filter payload \
  --save ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/sept-14/end-epoch-sept-14-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
