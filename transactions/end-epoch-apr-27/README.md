# End Epoch
> April 27, 2021

## Build (Kan)

```sh
flow transactions build ./templates/end_epoch_change_payout.cdc \
  --network mainnet \
  --args "$(cat "./transactions/end-epoch-apr-27/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 4 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-1.rlp
```

## Dete Signs

```sh
flow transactions sign ./transactions/end-epoch-apr-27/end-epoch-apr-27-1.rlp \
  --signer dete \
  --filter payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-2.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch-apr-27/end-epoch-apr-27-2.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-3.rlp
```

## Peter Signs (If Needed)

```sh
flow transactions sign ./transactions/end-epoch-apr-27/end-epoch-apr-27-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch-apr-27/end-epoch-apr-27-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch-apr-27/end-epoch-apr-27-4.rlp
```
