# Pay Rewards
> March 16th, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/mar-16/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-unsigned.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-unsigned.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/mar-16/pay-rewards-mar-16-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/1f82f2b99296348450c9c7bd5da0a28b7d9b4d9b382c317aef1b782e22b324ca
