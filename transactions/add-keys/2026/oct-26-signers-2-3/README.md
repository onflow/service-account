# Add Flow Foundation keys 2 & 3 to the service account and staking account

> **Date**: October 26th, 2026 — signers 2 & 3

## Context

This ceremony migrates **Foundation key 2 (Peter)** and **Foundation key 3 (Kan)** from Google Cloud KMS to AWS KMS. Foundation key 1 (Vishal) was migrated in the earlier [`2026/oct-26`](../oct-26/README.md) ceremony.

Instead of running two separate per-signer ceremonies, we do one combined pass per on-chain account:

1. One `add_two_keys` transaction registers **both** new AWS pubkeys on the service account.
2. One `revoke_two_keys` transaction revokes both old GCP indices on the service account, **co-signed by Peter and Kan using their new AWS keys** (`peter-aws`, `kan-aws` entries in `flow.json`, added in this PR). The revoke doubles as the AWS smoke test — if either AWS signer path is broken the revoke tx can't seal, the GCP keys stay live, and nothing on-chain changes. No separate `hello.cdc` is needed.
3. Repeat the same add → revoke pattern on the staking account.

Templates:
- Add: [`templates/add_two_keys.cdc`](../../../../templates/add_two_keys.cdc)
- Revoke: [`revoke_two_keys.cdc`](./revoke_two_keys.cdc)

> **Signer workflow note**: every code block below is a complete copy-paste for one signer. The `git pull` at the top syncs the previous signer's RLP into your clone; the `git add` / `git commit` / `git push` at the bottom publishes your signed RLP for the next signer. All work happens on branch `vishal/aws-foundation-signers-2-3-oct-26`.

## Public keys being added

**Foundation key 2 — AWS KMS (Peter)**:
- Pubkey hex: `a5acfad41e4a6e44080e7c8444be040d16995eefe05ffe6744ae385b079c8de01201b3ca8c4ba1cd8ddf4cf22d640dcb0e817495ff5f2cf520b86f708f10cdc2`
- Signature algorithm: `ECDSA_P256` (1)
- Hash algorithm: `SHA2_256` (1)
- Weight: `250.0`

**Foundation key 3 — AWS KMS (Kan)**:
- Pubkey hex: `3abfe3bc37865735ff2a701adcd960a73371814ab1f79ce9837a80dcb61f61d8cdfd4fd529fcc381a600d05e653047d2ad136478f8536024585850c0cff39044`
- Signature algorithm: `ECDSA_P256` (1)
- Hash algorithm: `SHA2_256` (1)
- Weight: `250.0`

### Indices

The two pubkeys land at the next two free indices on each account, in the order Peter → Kan:

| | Peter new AWS | Kan new AWS |
|---|---|---|
| Service account `0xe467b9dd11fa00df` | **21** | **22** |
| Staking account `0x8624b52f9ddcd04a` | **13** | **14** |

### Old GCP indices to revoke

| | Peter old GCP (`dapperlabs_3`) | Kan old GCP (`dapperlabs_1`) |
|---|---|---|
| Service account | **13** | **11** |
| Staking account | **7** | **5** |

Current highest active key is 20 on service / 12 on staking (Vishal's new AWS keys from the previous ceremony). Confirm from FlowScan before building.

### `flow.json` / `flow-staking.json` entries

This PR adds two new accounts to both config files:

- `peter-aws` — points at AWS KMS at service idx 21 / staking idx 13.
- `kan-aws`   — points at AWS KMS at service idx 22 / staking idx 14.

The existing `peter` and `kan` entries (GCP KMS, at their old indices) stay in place. Peter and Kan sign with `peter` / `kan` for the AddKey transactions (Steps 1 and 3) and with `peter-aws` / `kan-aws` for the revoke transactions (Steps 2 and 4). After Step 4 seals, the old `peter` and `kan` entries can be removed in a follow-up cleanup.

## Step 1 — AddKey (both keys) on the service account

### Build (Vishal)

```sh
git pull
flow transactions build ./templates/add_two_keys.cdc \
  --network mainnet \
  --args-json "$(cat ./transactions/add-keys/2026/oct-26-signers-2-3/arguments_add_service.json)" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 20 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 9999 \
  -x payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-unsigned.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-unsigned.rlp
git commit -m "service add: unsigned rlp"
git push
```

### Collect signatures (vishal AWS + peter GCP + bluesign GCP + kan GCP = 4 × 250w = 1000w)

Vishal signs from AWS (`AWS_PROFILE=signer-1` must be active). Peter and Kan sign with their current GCP keys — their new AWS pubkeys don't exist on-chain yet.

```sh
# Signer 1 — vishal (AWS KMS key, service idx 20; also proposer)
git pull
export AWS_PROFILE=signer-1
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-1.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-1.rlp
git commit -m "service add: vishal sign"
git push
```

```sh
# Signer 2 — peter (GCP key, service idx 13)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-1.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-2.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-2.rlp
git commit -m "service add: peter sign"
git push
```

```sh
# Signer 3 — bluesign/Denniz (GCP key, service idx 18)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-2.rlp \
  --signer bluesign \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-3.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-3.rlp
git commit -m "service add: bluesign sign"
git push
```

```sh
# Signer 4 — kan (GCP key, service idx 11; closes the envelope)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-complete.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-complete.rlp
git commit -m "service add: kan sign"
git push
```

### Submit (Vishal)

```sh
git pull
flow transactions send-signed \
  --network mainnet \
  ./transactions/add-keys/2026/oct-26-signers-2-3/service-add-sig-complete.rlp
# Record the sealed tx id in the "Results" section at the bottom of this README,
# then:
git add transactions/add-keys/2026/oct-26-signers-2-3/README.md
git commit -m "service add: record tx id"
git push
```

Confirm from the FlowScan transaction result that Peter's pubkey landed at **service idx 21** and Kan's at **service idx 22** before proceeding to Step 2. These values match the pre-committed `peter-aws` / `kan-aws` entries in `flow.json`.

## Step 2 — Revoke old GCP keys on the service account (also: Peter & Kan AWS smoke test)

**Gate**: Step 1 sealed and new indices confirmed.

**Why this doubles as the smoke test**: this transaction is co-signed by both Peter and Kan with their new AWS keys (via the `peter-aws` and `kan-aws` entries). If either AWS signer path is broken, the tx can't accumulate enough weight to seal, nothing on-chain changes, and the old GCP keys stay fully live. If the tx seals, we've proven on mainnet that both AWS KMS sign paths work end-to-end — same guarantee as a `hello.cdc` smoke test, with the state effect of revoking the old GCP identities as a bonus.

### Build (Vishal)

```sh
git pull
flow transactions build ./transactions/add-keys/2026/oct-26-signers-2-3/revoke_two_keys.cdc \
  --network mainnet \
  --args-json "$(cat ./transactions/add-keys/2026/oct-26-signers-2-3/arguments_revoke_service.json)" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 20 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 9999 \
  -x payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-unsigned.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-unsigned.rlp
git commit -m "service revoke: unsigned rlp"
git push
```

### Collect signatures (vishal AWS + peter AWS + bluesign GCP + kan AWS = 4 × 250w = 1000w)

Each AWS signer must have the right profile exported — `signer-1` (Vishal), `signer-2` (Peter), `signer-3` (Kan). MFA prompt once per hour per signer.

```sh
# Signer 1 — vishal (AWS KMS key, service idx 20; also proposer)
git pull
export AWS_PROFILE=signer-1
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-1.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-1.rlp
git commit -m "service revoke: vishal sign"
git push
```

```sh
# Signer 2 — peter (AWS KMS key, service idx 21 — brand new; uses the peter-aws flow.json entry)
git pull
export AWS_PROFILE=signer-2
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-1.rlp \
  --signer peter-aws \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-2.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-2.rlp
git commit -m "service revoke: peter sign (aws)"
git push
```

```sh
# Signer 3 — bluesign/Denniz (GCP key, service idx 18)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-2.rlp \
  --signer bluesign \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-3.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-3.rlp
git commit -m "service revoke: bluesign sign"
git push
```

```sh
# Signer 4 — kan (AWS KMS key, service idx 22 — brand new; uses the kan-aws flow.json entry)
git pull
export AWS_PROFILE=signer-3
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-3.rlp \
  --signer kan-aws \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-complete.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-complete.rlp
git commit -m "service revoke: kan sign (aws)"
git push
```

### Submit (Vishal)

```sh
git pull
flow transactions send-signed \
  --network mainnet \
  ./transactions/add-keys/2026/oct-26-signers-2-3/service-revoke-sig-complete.rlp
# Record the sealed tx id in the "Results" section at the bottom of this README,
# then:
git add transactions/add-keys/2026/oct-26-signers-2-3/README.md
git commit -m "service revoke: record tx id"
git push
```

**If the tx seals**: Peter's and Kan's AWS KMS integrations are proven on mainnet. Confirm on FlowScan that service idx 13 (Peter old GCP) and idx 11 (Kan old GCP) both show `Revoked: true`. **→ Proceed to Step 3.**

**If any signer errors locally during sign**: stop. The GCP keys are still live and nothing on-chain has changed. Debug AWS for the affected signer before touching the staking account.

## Step 3 — AddKey (both keys) on the staking account

**Gate**: Step 2 sealed successfully.

### Build (Vishal)

```sh
git pull
flow transactions build ./templates/add_two_keys.cdc \
  --network mainnet \
  --args-json "$(cat ./transactions/add-keys/2026/oct-26-signers-2-3/arguments_add_staking.json)" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 12 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  --gas-limit 9999 \
  -x payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-unsigned.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-unsigned.rlp
git commit -m "staking add: unsigned rlp"
git push
```

### Collect signatures (vishal AWS + peter GCP + bluesign GCP + kan GCP = 4 × 250w = 1000w)

Peter and Kan sign with their current staking GCP keys — their new AWS pubkeys don't exist on the staking account yet.

```sh
# Signer 1 — vishal (AWS KMS key, staking idx 12; also proposer)
git pull
export AWS_PROFILE=signer-1
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-unsigned.rlp \
  -f flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-1.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-1.rlp
git commit -m "staking add: vishal sign"
git push
```

```sh
# Signer 2 — peter (GCP key, staking idx 7)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-1.rlp \
  -f flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-2.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-2.rlp
git commit -m "staking add: peter sign"
git push
```

```sh
# Signer 3 — bluesign/Denniz (GCP key, staking idx 10)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-2.rlp \
  -f flow-staking.json \
  --signer bluesign \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-3.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-3.rlp
git commit -m "staking add: bluesign sign"
git push
```

```sh
# Signer 4 — kan (GCP key, staking idx 5)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-3.rlp \
  -f flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-complete.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-complete.rlp
git commit -m "staking add: kan sign"
git push
```

### Submit (Vishal)

```sh
git pull
flow transactions send-signed \
  --network mainnet \
  ./transactions/add-keys/2026/oct-26-signers-2-3/staking-add-sig-complete.rlp
# Record the sealed tx id in the "Results" section at the bottom of this README,
# then:
git add transactions/add-keys/2026/oct-26-signers-2-3/README.md
git commit -m "staking add: record tx id"
git push
```

Confirm from FlowScan that Peter's pubkey landed at **staking idx 13** and Kan's at **staking idx 14**. These values match the pre-committed `peter-aws` / `kan-aws` entries in `flow-staking.json`.

## Step 4 — Revoke old GCP keys on the staking account

**Gate**: Step 3 sealed.

AWS → flow-cli → on-chain verifier is already proven for all three signers by Step 2 on the service account; the staking account revoke is just the symmetric cleanup against the same KMS key material.

### Build (Vishal)

```sh
git pull
flow transactions build ./transactions/add-keys/2026/oct-26-signers-2-3/revoke_two_keys.cdc \
  --network mainnet \
  --args-json "$(cat ./transactions/add-keys/2026/oct-26-signers-2-3/arguments_revoke_staking.json)" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 12 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  --gas-limit 9999 \
  -x payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-unsigned.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-unsigned.rlp
git commit -m "staking revoke: unsigned rlp"
git push
```

### Collect signatures (vishal AWS + peter AWS + bluesign GCP + kan AWS = 4 × 250w = 1000w)

```sh
# Signer 1 — vishal (AWS KMS key, staking idx 12; also proposer)
git pull
export AWS_PROFILE=signer-1
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-unsigned.rlp \
  -f flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-1.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-1.rlp
git commit -m "staking revoke: vishal sign"
git push
```

```sh
# Signer 2 — peter (AWS KMS key, staking idx 13; uses the peter-aws flow-staking.json entry)
git pull
export AWS_PROFILE=signer-2
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-1.rlp \
  -f flow-staking.json \
  --signer peter-aws \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-2.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-2.rlp
git commit -m "staking revoke: peter sign (aws)"
git push
```

```sh
# Signer 3 — bluesign/Denniz (GCP key, staking idx 10)
git pull
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-2.rlp \
  -f flow-staking.json \
  --signer bluesign \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-3.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-3.rlp
git commit -m "staking revoke: bluesign sign"
git push
```

```sh
# Signer 4 — kan (AWS KMS key, staking idx 14; uses the kan-aws flow-staking.json entry)
git pull
export AWS_PROFILE=signer-3
flow transactions sign ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-3.rlp \
  -f flow-staking.json \
  --signer kan-aws \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-complete.rlp
git add ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-complete.rlp
git commit -m "staking revoke: kan sign (aws)"
git push
```

### Submit (Vishal)

```sh
git pull
flow transactions send-signed \
  --network mainnet \
  ./transactions/add-keys/2026/oct-26-signers-2-3/staking-revoke-sig-complete.rlp
# Record the sealed tx id in the "Results" section at the bottom of this README,
# then:
git add transactions/add-keys/2026/oct-26-signers-2-3/README.md
git commit -m "staking revoke: record tx id"
git push
```

After seal, confirm staking idx 7 (Peter old GCP) and idx 5 (Kan old GCP) both show `Revoked: true` on FlowScan. The Foundation multisig is now fully on AWS KMS for all three signer slots.

## Results

Step 1 (service AddKey both pubkeys) transaction: 9d3c1cba2859b1f5051476ad2960b10ce0882c8a97d39b90178a83dd23f648c2
Step 2 (service revoke old GCP + AWS smoke test) transaction: 70a82056c4d521edb427c6603676c12c2a66998609639e47ffa3c55041225013
Step 3 (staking AddKey both pubkeys) transaction: 8c7d98ef4b5d45848718a49a523d00f7c2cbd05cc804e954b79a1c75ea3adfa6
Step 4 (staking revoke old GCP) transaction: TBD
