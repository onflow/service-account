# Upgrade FlowServiceAccount and FlowStorageFees to read balances via `Account.balance`

> Sep 28th 2026

Issue: [#468](https://github.com/onflow/service-account/issues/468)

Upgrade the `FlowServiceAccount` and `FlowStorageFees` contracts on **mainnet**
to
[onflow/flow-core-contracts-internal#8](https://github.com/onflow/flow-core-contracts-internal/pull/8)
(commit `2952beb97cbf0d236bbd95a5e441706abde38bf9`). Protocol balance reads
switch from the republishable `/public/flowTokenBalance` capability to
`Account.balance` (canonical vault at `/storage/flowTokenVault`).

Signer: Service Account `0xe467b9dd11fa00df`

**Prerequisite (already satisfied):** native `Account.balance` in the FVM
(onflow/flow-go-internal#7240, onflow/flow-go#8658) is live on mainnet since
the v0.51.0 HCU (Aug 18th 2026). Deploying this upgrade before that HCU would
have caused infinite recursion in `defaultTokenBalance`.

Testnet was already upgraded to this exact code (verified: on-chain testnet
code matches the PR byte-for-byte modulo import addresses).

## Transactions

[update contract](../../../../templates/update_contract.cdc)

Contract code sourced from flow-core-contracts-internal at commit `2952beb9`
with imports adjusted for mainnet. Changes can be viewed here:
https://github.com/onflow/flow-core-contracts-internal/pull/8/files

### 1. FlowStorageFees

Used this to generate the contract code arguments:

`cat "./FlowStorageFees.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args_fsf_contract.json | jq -r '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowStorageFees.cdc
(Should produce no difference)
```

### 2. FlowServiceAccount

Used this to generate the contract code arguments:

`cat "./FlowServiceAccount.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args_fsa_contract.json | jq -r '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowServiceAccount.cdc
(Should produce no difference)
```

## Verification

Post-upgrade sanity check (returns `true` when both contracts read balances
from the canonical vault):

```
$ flow scripts execute check_upgrade.cdc "0xe467b9dd11fa00df" --network mainnet
```

The diff between the current mainnet contracts and the new code is exactly the
PR #8 diff (verified against on-chain code).

## Results

1. FlowStorageFees: https://www.flowscan.io/tx/c9d2c236a8cc11d5c82e1ba93a3e5421c7034ace495d68bda9c24956b09ce650
2. FlowServiceAccount: https://www.flowscan.io/tx/bd89af78ac2d12da2b0ff0b07f64439c8e3c0dba38aa1f20d365400ca7abb5af
