# End Epoch
> May 4, 2021

## Build (Kan)

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/may-4/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 4 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/end-epoch/may-4/end-epoch-may-4-unsigned.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/may-4/end-epoch-may-4-unsigned.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/may-4/end-epoch-may-4-1-sig.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch/may-4/end-epoch-may-4-1-sig.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch/may-4/end-epoch-may-4-2-sig.rlp
```

## Peter Signs (If Needed)

```sh
flow transactions sign ./transactions/end-epoch/may-4/end-epoch-may-4-2-sig.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/may-4/end-epoch-may-4-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/may-4/end-epoch-may-4-complete.rlp
```
