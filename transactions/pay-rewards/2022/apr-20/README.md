# Pay Rewards
> April 20th, 2022

Link to node IDs here: https://github.com/onflow/flow/blob/master/nodeoperators/NodeOperatorList.md

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/apr-20/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/apr-20/pay-rewards-apr-20-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
