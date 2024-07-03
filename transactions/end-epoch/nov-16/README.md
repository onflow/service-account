# End Epoch
> November 16th, 2021

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| Alxo | Verification | f7422f2d3296ede4d1efb36ec55e3fd93702c061f7ee627881f0b3007beff2ed




## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v4.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/nov-16/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/nov-16/end-epoch-nov-16-unsigned.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-16/end-epoch-nov-16-unsigned.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-1.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-1.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/nov-16/end-epoch-nov-16-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/993e78c383dc071d7d1bc10f4b387aed83a243115a77c3e1ff7f69cf0503cefe
