# End Epoch
> April 27, 2021

## Build (Kan)

```sh
flow transactions build ./templates/end_epoch_change_payout.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch-apr-27/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 4 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-unsigned.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch-apr-27/end-epoch-apr-27-unsigned.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-1-sig.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch-apr-27/end-epoch-apr-27-1-sig.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-2-sig.rlp
```

## Peter Signs (If Needed)

```sh
flow transactions sign ./transactions/end-epoch-apr-27/end-epoch-apr-27-2-sig.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch-apr-27/end-epoch-apr-27-complete.rlp
```
