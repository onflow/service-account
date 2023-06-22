# Update FlowIDTableStaking Contract

> May 3, 2023

Upgrade to the `FlowEpoch` contract as per these pull requests:

- https://github.com/onflow/flow-core-contracts/pull/352
- https://github.com/onflow/flow-core-contracts/pull/365

These include changes to enable automated staking rewards.

## Transaction

[upgrade_and_enable_rewards.cdc](./upgrade_and_enable_rewards.cdc)

Used this to generate the contract code argument:

`cat "./FlowEpoch.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-FlowEpoch-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowEpoch.cdc
(Should produce no difference)
```

For the bonus tokens argument, this is where the number came from:

- Original - 65M bonus tokens
- ~44.1M+ burned in total so far
- ~20.9M left to be burned
Of which ~9.6M are in the queue to be burned (sitting in genesis wallet - will never go in circulation)
11.1M are left to be brought back to the service account
180,000 were never disbursed (were always in genesis wallet - will never go in circulation)

## Sequence of signing: 

1. DapperLabs generates the Signature Request ID on the [site]() for the `upgrade_and_enable_rewards.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Results
Failed attempts:
1. ec12be731ef7e551446e0bb4683cb5e64b174e61587a076d6dbf23937d039eb8
2. 325abc68becdc3f2a2d659605077f22bc01f051ba206309e56fd7b71c43f55a1

Successful attempt:
https://flowscan.org/transaction/d19c74cfb7347bc0643990632fc8c7ba781de618da49ef50686ce06d043196e5
