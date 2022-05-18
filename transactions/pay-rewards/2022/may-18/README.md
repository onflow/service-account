# Pay Rewards
> May 18th, 2022

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| SNZ | Verification | df5c2d5b9af9d0de5c4b70ce9adbdc7ae2af1a17485b4b8640f2c5b2c58d8954

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/may-18/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/may-18/pay-rewards-may-18-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
