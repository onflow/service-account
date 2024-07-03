# End Epoch
> July 27, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/july-27/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/july-27/end-epoch-july-27-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/july-27/end-epoch-july-27-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/july-27/end-epoch-july-27-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/july-27/end-epoch-july-27-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/july-27/end-epoch-july-27-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/july-27/end-epoch-july-27-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/july-27/end-epoch-july-27-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/july-27/end-epoch-july-27-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/july-27/end-epoch-july-27-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/july-27/end-epoch-july-27-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/8730f4ff3552ca1e47777e51eda0169f49880bf49da19106839a8e20ae6bbec6
