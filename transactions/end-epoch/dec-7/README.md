# End Epoch
> December 7th, 2021

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| Alxo | Verification | f7422f2d3296ede4d1efb36ec55e3fd93702c061f7ee627881f0b3007beff2ed




## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v4.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/dec-7/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/dec-7/end-epoch-dec-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-7/end-epoch-dec-7-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/dec-7/end-epoch-dec-7-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
