# End Epoch
> July 20, 2021

Adding 1 new Verification Node Operators:
- `Parafin` - `1cf032dd5b3cf9a63943e1f04472bb57cc1240d5cdd86c5fde05b4dabf8b1e7a`

Removing 1 Verification Node Operator:
- `OpenWorlds` - `8d4dbdd523bd4c67ffad9282a7acefc65641d25ac9c40759de9df859eb7255e3`

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/july-20/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/end-epoch/july-20/end-epoch-july-20-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/july-20/end-epoch-july-20-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/july-20/end-epoch-july-20-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/july-20/end-epoch-july-20-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/july-20/end-epoch-july-20-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/july-20/end-epoch-july-20-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/july-20/end-epoch-july-20-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/july-20/end-epoch-july-20-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/july-20/end-epoch-july-20-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/july-20/end-epoch-july-20-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
