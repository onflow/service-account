# End Epoch
> November 30th, 2021

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| Alxo | Verification | f7422f2d3296ede4d1efb36ec55e3fd93702c061f7ee627881f0b3007beff2ed
| Samsung | Execution | 6c6af0933b710655ec553f4bead3b01c5e0a3ffd1194ee536efb926b356c54aa




## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v4.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/nov-30/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/nov-30/end-epoch-nov-30-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-30/end-epoch-nov-30-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-1.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-1.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/nov-30/end-epoch-nov-30-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/8bf3cb26e1d0996811c5855f4b99e1cea0c5244400f4d4e69fcfea2ec6f847ae
