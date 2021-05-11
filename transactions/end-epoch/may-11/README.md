# End Epoch
> May 11, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/may-11/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 4 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 9999 \
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

## Equilibrium Signs

```sh
./flow-arm64-darwin-v0.20.0-alpha.1 transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-1.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-2.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-2.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-3.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-3.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-4.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-4.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-5.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-5.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-6.rlp
```

## Peter Signs (If Needed)

```sh
flow transactions sign ./transactions/end-epoch/may-11/end-epoch-may-11-sig-6.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/may-11/end-epoch-may-11-sig-7.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/may-11/end-epoch-may-11-sig-7.rlp
```
