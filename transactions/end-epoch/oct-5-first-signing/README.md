# End Epoch
> October 5th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v2.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/oct-5-first-signing/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/oct-5-first-signing/end-epoch-oct-5-first-signing-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/10fd2d7642ec87e61a8222491297c9462c6fdc3d331662ff7115a0e1becb3e21
