# Pay Rewards
> April 19th, 2023

### 50% Rewards
Node ID: 6c6af0933b710655ec553f4bead3b01c5e0a3ffd1194ee536efb926b356c54aa

## New method using Flow CLI multi-sign

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=capability_pay_rewards.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UFix64%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%221332699.0%22%20%20%20%20%20%7D,%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Dictionary%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22key%22:%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%226c6af0933b710655ec553f4bead3b01c5e0a3ffd1194ee536efb926b356c54aa%22%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22UFix64%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%220.5%22%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=1000000) for the `capability_rewards_pay.cdc` transaction with the given args.

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


https://flowscan.org/transaction/
