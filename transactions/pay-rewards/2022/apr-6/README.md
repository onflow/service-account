# Pay Rewards
> April 6th, 2022

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

| Node Operator             | Node Type          | Node ID  |
|:--------------------------|:-------------------|:---------|
| Bison Trails | Consensus | 501b5243b91d93622a18ef1cd42848bb7c47a55b2f02ea6404cd7add2229f8e3

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/apr-6/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/apr-6/pay-rewards-apr-6-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
