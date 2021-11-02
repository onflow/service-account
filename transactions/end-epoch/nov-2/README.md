# End Epoch
> November 2nd, 2021

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|




## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v4.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/nov-2/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/nov-2/end-epoch-nov-2-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-2/end-epoch-nov-2-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/nov-2/end-epoch-nov-2-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
