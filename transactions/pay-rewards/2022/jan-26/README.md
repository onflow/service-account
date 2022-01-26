# Pay Rewards
> January 26th, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/jan-26/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-unsigned.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-unsigned.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jan-26/pay-rewards-jan-26-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/1bb513bd3fead5150be730969161d9f7d30a0a04b7d464dc38f517cd85b01239
