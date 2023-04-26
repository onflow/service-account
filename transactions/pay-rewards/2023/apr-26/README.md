# Pay Rewards
> April 26th, 2023

The rewards are being paid after the epoch has ended,
so we have to use a different method than usual.

This time, we utilize the previous epoch's saved reward breakdown
from the `FlowEpoch` contract as our source of reward amounts.

Since the reward amounts have already been calculated,
rewards cannot be withheld from any node operators this epoch.

Transaction: ./capability_pay_rewards_from_previous_epoch.cdc

### 50% Rewards

None

## New method using Flow CLI multi-sign

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=capability_pay_rewards.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UFix64%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%221333950.0%22%20%20%20%20%20%7D,%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Dictionary%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22key%22:%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%226c6af0933b710655ec553f4bead3b01c5e0a3ffd1194ee536efb926b356c54aa%22%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22UFix64%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%220.5%22%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=1000000) for the `capability_pay_rewards_from_previous_epoch.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./transactions/pay-rewards/2023/apr-26/capability_pay_rewards_from_previous_epoch.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2023/apr-26/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-unsigned.rlp
```

### 4X Signatures

```sh
flow transactions sign ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-unsigned.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-1.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-1.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-2.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-2.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-3.rlp
```

```sh
flow transactions sign ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-3.rlp \
  --signer <SIGNER> \
  --filter payload \
  --save ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2023/apr-26/pay-rewards-apr-26-sig-complete.rlp
```

## Results


https://flowscan.org/transaction/fbcadbf06a8bf96544f3bc3b4fedd74c363eba68802b03f9aac7c823f37075d5
