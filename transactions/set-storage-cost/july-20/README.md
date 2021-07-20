# Set Storage Cost
> July 20, 2021

Sets the storage cost to 100.0 megabytes per reserved FLOW

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_storage_cost.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-storage-cost/july-20/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/set-storage-cost/july-20/set-storage-cost-july-20-sig-complete.rlp
```

## Results

Failure - https://flowscan.org/transaction/3641b54d59623aaa9968a2235480c75e949e5e8aa51db8b0f8486c90bbc903ea
https://flowscan.org/transaction/
