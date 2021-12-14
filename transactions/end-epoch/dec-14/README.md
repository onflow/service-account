# End Epoch
> December 14th, 2021


## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v5.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/dec-14/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/dec-14/end-epoch-dec-14-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-14/end-epoch-dec-14-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/dec-14/end-epoch-dec-14-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
