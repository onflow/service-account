# Pay Rewards
> July 6th, 2022

## Dapper Labs Builds

| Node Operator | Node Type    | Node ID  |
|:--------------|:-------------|:---------|
| StakeFish     | Consensus    | b09bfbaf2d9e6f6541855dc65b8e0247bd97a0cceb607b9cf89ed368bc16308d

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/jul-6/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jul-6/pay-rewards-jul-6-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/d7861b9657fd5bd2190bf963b4db1099e49a184efc64e12af96974679cc93773
