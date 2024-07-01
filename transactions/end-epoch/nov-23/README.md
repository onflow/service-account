# End Epoch
> November 23rd, 2021

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| Alxo | Verification | f7422f2d3296ede4d1efb36ec55e3fd93702c061f7ee627881f0b3007beff2ed




## Dapper Labs Builds

```sh
flow transactions build ./../capability_end_epoch_v4.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/nov-23/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/nov-23/end-epoch-nov-23-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-23/end-epoch-nov-23-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/nov-23/end-epoch-nov-23-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/be839d4aab6a6443e1c6f16c77f7ee9134b3d923893c6ba8aa90b08647762bfe
