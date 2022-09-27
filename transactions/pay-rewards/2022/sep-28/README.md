# Pay Rewards
> Sept 28th, 2022

## Slashing 50% reward for nodes which were not up for 80% of the time last week
1. 21b21ad1ddb5e3002cc6a3faa55e23d70db014ee229c213f7a43769789125536

## New method using Flow CLI multi-sign

1. DapperLabs generates the Signature Request ID on the [site]() for the `capability_rewards_pay.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/sep-28/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-sig-1.rlp
```

### Find Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-sig-3.rlp
```

### Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/sep-28/pay-rewards-sep-28-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
