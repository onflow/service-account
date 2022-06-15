# Pay Rewards
> June 15th, 2022

## Dapper Labs Builds

| Node Operator | Node Type    | Node ID  |
|:--------------|:-------------|:---------|
| Bitcoun Louie | Verification | fffba108a52e4ca8f5d30658c3f03f47ad1cc13a0995435c0532336236813218
| NateAlex      | Verification | f8af31c7c3294b246f34040e5685c351e89f1c1edf6c64f93f7babd73d149951

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/jun-15/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jun-15/pay-rewards-jun-15-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
