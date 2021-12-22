# End Epoch
> December 22nd, 2021


## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v5.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/dec-22/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/dec-22/end-epoch-dec-22-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-22/end-epoch-dec-22-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/dec-22/end-epoch-dec-22-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
