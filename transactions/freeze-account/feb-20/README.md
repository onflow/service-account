# Freeze Account
> Feb 20th, 2023

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
  --args-json "$(cat "./transactions/pay-rewards/2023/feb-15/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2023/feb-15/pay-rewards-feb-15-unsigned.rlp
```

## Results


https://flowscan.org/transaction/6fcb4c9d584b1f0bf1e8fb546628ea8a7e614d2d289c0dcc9c8fbae8343c7261
