# Pay Rewards
> May 11th, 2022

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| Chainflow | Verification | 3b57e0ee2ece1f1dbefbd868d3eaac63b32a11df5b1a37d231145ea219055dde

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/may-11/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-2.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/may-11/pay-rewards-may-11-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/34e207b07960c467213136b1d3b7e6a00e404b2ff312d2d2e764b3ec57e4e4fe
