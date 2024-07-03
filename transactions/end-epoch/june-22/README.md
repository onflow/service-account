# End Epoch
> June 22, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/june-22/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/june-22/end-epoch-june-22-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/june-22/end-epoch-june-22-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/june-22/end-epoch-june-22-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/june-22/end-epoch-june-22-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/june-22/end-epoch-june-22-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/june-22/end-epoch-june-22-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/june-22/end-epoch-june-22-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/june-22/end-epoch-june-22-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/june-22/end-epoch-june-22-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/june-22/end-epoch-june-22-sig-complete.rlp
```

## Results

Failed - https://flowscan.org/transaction/6f96c8b6177279595cfd7017864e6f74c697890bfd909a3b0e6416f6d0ecb3d2
Success - https://flowscan.org/transaction/207f908a7e949c1094dee63f71bf9f8487e07d8a2d904265b358ee03dc59441a
