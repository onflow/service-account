# End Epoch
> June 8, 2021

## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v1.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/june-8/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/june-8/end-epoch-june-8-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/june-8/end-epoch-june-8-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/june-8/end-epoch-june-8-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/june-8/end-epoch-june-8-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/june-8/end-epoch-june-8-sig-2.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/june-8/end-epoch-june-8-sig-2.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/june-8/end-epoch-june-8-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/june-8/end-epoch-june-8-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/june-8/end-epoch-june-8-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/june-8/end-epoch-june-8-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/8d06b6d75fd315cdbe0caf035fb42b8503aef5f12b875fb18c38b9329cf10b83
