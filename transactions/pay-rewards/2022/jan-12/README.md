# Pay Rewards
> January 12th, 2022

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| DCG | Collection | bd368122b0ccf67ebdd59d7f9b75edfa85106c3af41854c946ad0fa46e5c3ddd

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/jan-12/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jan-12/pay-rewards-jan-12-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/c1541b18ddd377983be4eda812100fb4b4baf5face603e6616e0f7d0391f8ddb
