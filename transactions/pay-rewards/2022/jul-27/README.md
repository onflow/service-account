# Pay Rewards
> July 27th, 2022

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
  --args-json "$(cat "./transactions/pay-rewards/2022/jul-27/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-1.rlp
```

### Animoca Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-2.rlp
```

### Find Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-3.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-3.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jul-27/pay-rewards-jul-27-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/b820957ef068360d5e1d3c425ffa0e3e334d2524c111c3cbbf35ce3fdd788d64
