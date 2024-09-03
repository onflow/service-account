# End Epoch
> May 11, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/may-11/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-1.rlp
```

## Equilibrium Signs (Skip)

```sh
./flow-arm64-darwin-v0.20.0-alpha.1 transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-1.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-2.rlp
```

## Ichi Signs (Skip)

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-2.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-3.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-2.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-3.rlp
```

## Kan Signs (skip)

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-4.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-5.rlp
```

## Alex Signs (Skip)

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-2.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/may-11/end-epoch-may-11-sig-4.rlp
```
