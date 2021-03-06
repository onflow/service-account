# Pay Rewards
> January 19th, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/jan-19/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jan-19/pay-rewards-jan-19-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/96e5ecf9943aecdacc40c5b99fd0163bc917997d9da341d62364593c0ea729b3
