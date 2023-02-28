# Pay Rewards
> Mar 1st, 2023

### 50% Rewards
Node ID: 3b57e0ee2ece1f1dbefbd868d3eaac63b32a11df5b1a37d231145ea219055dde

## New method using Flow CLI multi-sign

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=capability_pay_rewards.cdc&param=%5B%7B%22type%22:%22UFix64%22,%22value%22:%221323975.0%22%7D,%7B%22type%22:%22Dictionary%22,%22value%22:%5B%7B%22key%22:%7B%22type%22:%22String%22,%22value%22:%223b57e0ee2ece1f1dbefbd868d3eaac63b32a11df5b1a37d231145ea219055dde%22%7D,%22value%22:%7B%22type%22:%22UFix64%22,%22value%22:%220.5%22%7D%7D%5D%7D%5D&acct=0xe467b9dd11fa00df&limit=1000000) for the `capability_rewards_pay.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2023/mar-1/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-unsigned.rlp
```

### 4X Signatures

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-unsigned.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-1.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-1.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-2.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-2.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-3.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-3.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2023/mar-1/pay-rewards-mar-1-sig-complete.rlp
```

## Results


https://flowscan.org/transaction/
