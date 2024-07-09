# End Epoch
> October 19th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v2.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/oct-19/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/oct-19/end-epoch-oct-19-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-19/end-epoch-oct-19-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/oct-19/end-epoch-oct-19-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/ab8380881604ceae332783fa283b925b49f1c071e3e0eab7da1298570ed44c90
