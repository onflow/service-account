# Pay Rewards
> April 5th, 2023

## New method using Flow CLI multi-sign

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=capability_pay_rewards.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UFix64%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%221330201.0%22%20%20%20%20%20%7D,%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Dictionary%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=1000000) for the `capability_rewards_pay.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2023/mar-29/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-unsigned.rlp
```

### 4X Signatures

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-unsigned.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-1.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-1.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-2.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-2.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-3.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-3.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2023/mar-29/pay-rewards-mar-29-sig-complete.rlp
```

## Results


https://flowscan.org/transaction/b8b3d3a1dd4f8e36eb61c82d2acf5a807860460eb111a12f5d9a1c3025d661b3
