# Pay Rewards
> March 9th, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/mar-9/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/mar-9/pay-rewards-mar-9-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/64a8781b0c6873d98ec30d5ef6ee296dcdddf93a8c2ec2e4378a6cfaea6b2631
