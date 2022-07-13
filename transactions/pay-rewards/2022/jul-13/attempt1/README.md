# Pay Rewards
> July 13th, 2022

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
  --args-json "$(cat "./transactions/pay-rewards/2022/jul-13/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-unsigned.rlp
```

### Peter Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-unsigned.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-1.rlp
```

### Animoca Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-2.rlp
```

### Find Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-3.rlp
```

### Kan Signs

```sh
flow transactions sign ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/pay-rewards/2022/jul-13/pay-rewards-jul-13-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/4d6df8903be2edb892a948c6a57d4926bce0ef2f2935da25c599e7b3b454fd44

**Failed since the tool did not provide sufficient gas-limit.** 