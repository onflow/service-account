# End Epoch
> June 1, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/june-1/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/june-1/end-epoch-june-1-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-sig-1.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/june-1/end-epoch-june-1-sig-1.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-sig-2.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/june-1/end-epoch-june-1-sig-2.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-sig-3.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/june-1/end-epoch-june-1-sig-3.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-sig-4.rlp
```

---

# If Needed


## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/june-1/end-epoch-june-1-sig-4.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-sig-complete.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch/june-1/end-epoch-june-1-sig-3.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-sig-4.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/june-1/end-epoch-june-1-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/june-1/end-epoch-june-1-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/june-1/end-epoch-june-1-sig-complete.rlp
```

## Results

Failed - https://flowscan.org/transaction/e8b9b27c6254e7c58da8f8488f7ab14c08ae6b6b7d254e99a266cd579be3e189
Success - https://flowscan.org/transaction/6e97bf58f0261bbf06733c7b225f56f32032dd974e73aa8c2c72e2fddd6ab4f9
