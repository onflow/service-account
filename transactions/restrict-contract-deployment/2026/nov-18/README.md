# Restrict permissionless contract deployment

> **Date**: November 18th, 2026 — interim security measure

## Context

Flips `/storage/isContractDeploymentRestricted` on the service account from `false` back to `true`. While set to `true`, new contract deployments by accounts not listed in `/storage/authorizedAddressesToDeployContracts` are rejected.

**Scope — important**:

- ✅ Blocks `signer.contracts.add(...)` from any non-authorized account.
- ❌ Does **not** block `signer.contracts.update(...)` — the chain intentionally allows all contract updates.

This is a Cadence 1.0 version of the pre-1.0 transaction last used in [`transactions/set-permissionless/jul-5`](../../../set-permissionless/jul-5/README.md) (PR #146, July 5th 2022, which flipped the same slot to `false`).

## Transaction

- Script: [`set_contract_deployment_restricted.cdc`](./set_contract_deployment_restricted.cdc)
- Argument: `restricted: Bool = true` ([`arguments.json`](./arguments.json))

> **Signer workflow note**: every code block below is a complete copy-paste for one signer. The `git pull` at the top syncs the previous signer's RLP into your clone; the `git add` / `git commit` / `git push` at the bottom publishes your signed RLP for the next signer. All work happens on branch `local/restrict-contract-deployment-2026-nov-18`.

## Vishal Builds

```sh
git pull
flow transactions build ./transactions/restrict-contract-deployment/2026/nov-18/set_contract_deployment_restricted.cdc \
  --network mainnet \
  --args-json "$(cat ./transactions/restrict-contract-deployment/2026/nov-18/arguments.json)" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 20 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 9999 \
  -x payload \
  --save ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-unsigned.rlp
git add ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-unsigned.rlp
git commit -m "restrict: unsigned rlp"
git push
```

## Vishal Signs

```sh
git pull
flow transactions sign ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-1.rlp
git add ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-1.rlp
git commit -m "restrict: vishal sign"
git push
```

## Layne Signs

```sh
git pull
flow transactions sign ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-2.rlp
git add ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-2.rlp
git commit -m "restrict: layne sign"
git push
```

## Bluesign Signs

```sh
git pull
flow transactions sign ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-2.rlp \
  --signer bluesign \
  --filter payload \
  --save ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-3.rlp
git add ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-3.rlp
git commit -m "restrict: bluesign sign"
git push
```

## Kan Signs

```sh
git pull
flow transactions sign ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-complete.rlp
git add ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-complete.rlp
git commit -m "restrict: kan sign"
git push
```

## Somebody Submits

```sh
git pull
flow transactions send-signed --network mainnet ./transactions/restrict-contract-deployment/2026/nov-18/restrict-nov-18-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
