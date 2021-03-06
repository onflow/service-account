# Pay Rewards
> July 20th, 2022

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `capability_rewards_pay.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds


```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/jul-20/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-unsigned.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-1.rlp
```

### Animoca Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-2.rlp
```

### Find Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-3.rlp
```

### Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jul-20/pay-rewards-jul-20-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/f27b1e86b5e38452ca5fb2afa339d58e3f3ad868439fb530280b19155e5db97e
