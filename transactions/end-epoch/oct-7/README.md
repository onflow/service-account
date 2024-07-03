# End Epoch
> October 7th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v3.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/oct-7/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/oct-7/end-epoch-oct-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-7/end-epoch-oct-7-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/oct-7/end-epoch-oct-7-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/023e459a12030b717bfa6ea12ca52a773ddce103efab45fa8a622b37523d60f2
