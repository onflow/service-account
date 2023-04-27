# Update FlowIDTableStaking Contract

> May 3, 2023

Upgrade to the `FlowEpoch` contract as per these pull requests:

- https://github.com/onflow/flow-core-contracts/pull/352
- https://github.com/onflow/flow-core-contracts/pull/365

These include changes to enable automated staking rewards.

## Transaction

[upgrade_and_enable_rewards.cdc](./upgrade_and_enable_rewards.cdc)

Used this to generate args:

`cat "./FlowEpoch.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-FlowEpoch-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowEpoch.cdc
(Should produce no difference)
```

## Sequence of signing: 

1. DapperLabs generates the Signature Request ID on the [site]() for the `upgrade_and_enable_rewards.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Results

https://flowscan.org/transaction/
