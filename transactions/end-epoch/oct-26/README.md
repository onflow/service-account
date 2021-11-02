# End Epoch
> October 26th, 2021

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| Optakt | Consensus | f3b72c50794c29319f0f77f0c7d623662eb15253c291a5360d095a4ea282fadb
| Foundry | Collection | bd368122b0ccf67ebdd59d7f9b75edfa85106c3af41854c946ad0fa46e5c3ddd


## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_end_epoch_v4.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/end-epoch/oct-26/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/oct-26/end-epoch-oct-26-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-26/end-epoch-oct-26-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/oct-26/end-epoch-oct-26-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/f6fafde942e8b9538f1b92163e31f9752655fad6e69673cc1232829df81d5256
