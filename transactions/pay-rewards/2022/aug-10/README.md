# Pay Rewards
> Aug 10th, 2022

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=capability_pay_rewards.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UFix64%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%221288436.0%22%20%20%20%20%20%7D,%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Dictionary%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=1000000) for the `capability_rewards_pay.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds


```sh
flow transactions build ./templates/capability_pay_rewards.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/pay-rewards/2022/aug-10/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-sig-1.rlp
```

### Find Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-sig-3.rlp
```

### Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/aug-10/pay-rewards-aug-10-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
