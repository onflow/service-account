# End Epoch
> July 13, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/july-13/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/july-13/end-epoch-july-13-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/july-13/end-epoch-july-13-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/july-13/end-epoch-july-13-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/july-13/end-epoch-july-13-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/july-13/end-epoch-july-13-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/july-13/end-epoch-july-13-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/july-13/end-epoch-july-13-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/july-13/end-epoch-july-13-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/july-13/end-epoch-july-13-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/july-13/end-epoch-july-13-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/ade3ad62894c99798876b0c8fb9db84e978a14e23095944abcf76d614e5c018b
