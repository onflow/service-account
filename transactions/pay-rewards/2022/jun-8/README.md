# Pay Rewards
> June 8th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/jun-8/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-2.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jun-8/pay-rewards-jun-8-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
