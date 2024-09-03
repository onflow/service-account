# End Epoch
> May 18, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/may-18/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/may-18/end-epoch-may-18-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-sig-1.rlp
```

## Equilibrium Signs

```sh
./flow-arm64-darwin-v0.20.0-alpha.1 transactions sign ./transactions/end-epoch/may-18/end-epoch-may-18-sig-1.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-sig-2.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/may-18/end-epoch-may-18-sig-2.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-sig-3.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/may-18/end-epoch-may-18-sig-3.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-sig-4.rlp
```

---

# If Needed


## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/may-18/end-epoch-may-18-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-sig-4.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch/may-18/end-epoch-may-18-sig-3.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-sig-4.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/may-18/end-epoch-may-18-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/may-18/end-epoch-may-18-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/may-18/end-epoch-may-18-sig-4.rlp
```
