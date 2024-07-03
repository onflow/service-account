# End Epoch
> July 6, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/july-6/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/july-6/end-epoch-july-6-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/july-6/end-epoch-july-6-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/july-6/end-epoch-july-6-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/july-6/end-epoch-july-6-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/july-6/end-epoch-july-6-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/july-6/end-epoch-july-6-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/july-6/end-epoch-july-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/july-6/end-epoch-july-6-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/july-6/end-epoch-july-6-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/july-6/end-epoch-july-6-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/406c3fe36fb4eb05cb3ba830cb0a8b66b6fc6d6f3d56e237eef201fe3b7b9821
