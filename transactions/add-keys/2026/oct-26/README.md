# Add Flow Foundation key 1 to the service account and staking account

> **Date**: October 26th, 2026

## Context

Flow Foundation is migrating its three multisig signing keys from Google Cloud KMS to AWS KMS.

This ceremony is **slot 1 of three** — it adds Foundation key 1's new AWS KMS pubkey to the service account and staking account. The existing GCP-backed on-chain key currently held by this slot's signer stays live. We do not revoke anything in this ceremony.

**Why not revoke the old GCP key now?** Foundation key 1's current GCP identity on-chain is at service account index 12 and staking account index 6. That identity is co-held with Foundation key 3's current signer (both access the same GCP-backed key). Revoking service idx 12 / staking idx 6 before Foundation key 3's AWS pubkey is also added on-chain would leave Foundation key 3's holder without on-chain signing capability. The GCP revoke happens in a later ceremony, after Foundation key 3's add_keys has landed.

**Ceremony order**: service AddKey → smoke-test sign with the new AWS key on the service account → **only if the smoke test succeeds**, staking AddKey. If AWS signing is broken, we stop after the smoke test fails — the staking account key index isn't committed, and the GCP keys are still fully live.

Transaction template: [add_keys.cdc](../../../../templates/add_keys.cdc)

## Public key being added

**Foundation key 1 — AWS KMS**:
- Pubkey hex: `f5e209e9a840be7a1f39679011e9f6a981f204dc2788f4bb0df987cbbfa7fa51f37b95e35323d4418ade8cb9f73b9d9f888f182236f2ca6bd393521d2d736937`
- Signature algorithm: `ECDSA_P256` (1)
- Hash algorithm: `SHA2_256` (1) — AWS KMS only signs ECDSA with SHA2_256
- Weight: `250.0`
- Backing KMS key: `arn:aws:kms:us-east-2:200591809096:key/mrk-214252e743b743a296fdbb3b9f917392` (alias `alias/flow-foundation-key-1`)

The pubkey will land at the next free index on each account:
- **Service account**: index **20** (current highest active key is 19)
- **Staking account**: index **12** (current highest active key is 11)

## Step 1 — AddKey on the service account

### Build

```sh
flow transactions build ./templates/add_keys.cdc \
  --network mainnet \
  --args-json "$(cat ./transactions/add-keys/2026/oct-26/arguments_service_account.json)" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 12 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-keys/2026/oct-26/service-oct-26-unsigned.rlp
```

### Collect signatures (vishal + peter + bluesign + layne = 4 × 250w = 1000w)

```sh
# Signer 1 — vishal (GCP key, service idx 12; also proposer)
flow transactions sign ./transactions/add-keys/2026/oct-26/service-oct-26-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/service-oct-26-sig-1.rlp

# Signer 2 — peter (GCP key, service idx 13)
flow transactions sign ./transactions/add-keys/2026/oct-26/service-oct-26-sig-1.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/service-oct-26-sig-2.rlp

# Signer 3 — bluesign/Denniz (GCP key, service idx 18)
flow transactions sign ./transactions/add-keys/2026/oct-26/service-oct-26-sig-2.rlp \
  --signer bluesign \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/service-oct-26-sig-3.rlp

# Signer 4 — layne (GCP key, service idx 19; closes the envelope)
flow transactions sign ./transactions/add-keys/2026/oct-26/service-oct-26-sig-3.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/service-oct-26-sig-complete.rlp
```

All four signers use their existing GCP KMS keys — Foundation key 1's AWS entity doesn't exist on-chain yet, so can't sign for itself.

### Submit

```sh
flow transactions send-signed \
  --network mainnet \
  ./transactions/add-keys/2026/oct-26/service-oct-26-sig-complete.rlp
```

### Record the new index

The new pubkey will land at **index 20** on the service account. Confirm this from the FlowScan transaction result before proceeding to Step 2.

## Step 2 — Smoke-test sign on the service account (`hello.cdc`)

**Gate**: only run this step after Step 1 has sealed and you have the new service account key index. The smoke test is what proves AWS signing works end-to-end before we touch the staking account.

### Flip Foundation key 1's `flow.json` entry to AWS KMS

Foundation key 1's holder (Vishal) updates their `flow.json` entry for the service account:

```json
"vishal": {
  "address": "e467b9dd11fa00df",
  "key": {
    "type": "aws-kms",
    "index": 20,
    "signatureAlgorithm": "ECDSA_P256",
    "hashAlgorithm": "SHA2_256",
    "resourceID": "arn:aws:kms:us-east-2:200591809096:key/mrk-214252e743b743a296fdbb3b9f917392"
  }
}
```

The GCP KMS entry at old index 12 stays in the file but is no longer used by this signer.

### Build the test transaction

```sh
flow transactions build ./transactions/add-keys/2026/oct-26/hello.cdc \
  --network mainnet \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 20 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-keys/2026/oct-26/hello-oct-26-unsigned.rlp
```

### Foundation key 1 holder signs with AWS KMS first

Before running this, the signer exports their signer-1 AWS profile:

```sh
export AWS_PROFILE=signer-1
aws sts get-caller-identity   # expect assumed-role/signer-1/vishal; MFA prompt
```

Then:

```sh
flow transactions sign ./transactions/add-keys/2026/oct-26/hello-oct-26-unsigned.rlp \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-1-aws.rlp
```

`flow-cli` reads the AWS-KMS entry in `flow.json`, calls `kms:Sign` via the signer-1 role, and writes the signature into the RLP file. **This is the signing step we're validating** — if `flow-cli` returns an error, AWS integration is broken and we **stop here**: do not proceed to Step 3.

### Collect three more signatures (peter + bluesign + layne = 3 × 250w = 750w)

```sh
# Signer 2 — peter (GCP key, service idx 13)
flow transactions sign ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-1-aws.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-2.rlp

# Signer 3 — bluesign/Denniz (GCP key, service idx 18)
flow transactions sign ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-2.rlp \
  --signer bluesign \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-3.rlp

# Signer 4 — layne (GCP key, service idx 19)
flow transactions sign ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-3.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-complete.rlp
```

### Submit

```sh
flow transactions send-signed \
  --network mainnet \
  ./transactions/add-keys/2026/oct-26/hello-oct-26-sig-complete.rlp
```

**If this transaction seals**, we've proven end-to-end on mainnet that:
- flow-cli's `aws-kms` key type reaches AWS KMS correctly.
- AWS KMS signs with a valid ECDSA signature.
- The on-chain verifier accepts the signature against the just-added pubkey.

**→ Proceed to Step 3.**

**If any step errors**, Foundation key 1's old GCP identity at service idx 12 / staking idx 6 remains live and functional; the Foundation isn't blocked. **Do not run Step 3.** Debug AWS before touching anything else.

## Step 3 — AddKey on the staking account

**Gate**: only run this step after Step 2 (smoke test) has sealed successfully.

Same arguments file, different proposer / authorizer / payer:

```sh
flow transactions build ./templates/add_keys.cdc \
  --network mainnet \
  --args-json "$(cat ./transactions/add-keys/2026/oct-26/arguments_staking_account.json)" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 6 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-keys/2026/oct-26/staking-oct-26-unsigned.rlp
```

Same signature-collection + send-signed pattern as Step 1, with staking account signer names:

```sh
# Signer 1 — vishal (GCP key, staking idx 6; also proposer)
flow transactions sign ./transactions/add-keys/2026/oct-26/staking-oct-26-unsigned.rlp \
  -f flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-1.rlp

# Signer 2 — peter (GCP key, staking idx 7)
flow transactions sign ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-1.rlp \
  -f flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-2.rlp

# Signer 3 — bluesign/Denniz (GCP key, staking idx 10)
flow transactions sign ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-2.rlp \
  -f flow-staking.json \
  --signer bluesign \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-3.rlp

# Signer 4 — layne (GCP key, staking idx 11)
flow transactions sign ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-3.rlp \
  -f flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-complete.rlp
```

```sh
flow transactions send-signed \
  --network mainnet \
  ./transactions/add-keys/2026/oct-26/staking-oct-26-sig-complete.rlp
```

After seal, Foundation key 1's holder (Vishal) flips their `flow-staking.json` entry to `aws-kms` at staking index **12**:

```json
"vishal": {
  "address": "8624b52f9ddcd04a",
  "keys": [
    {
      "type": "aws-kms",
      "index": 12,
      "signatureAlgorithm": "ECDSA_P256",
      "hashAlgorithm": "SHA2_256",
      "resourceID": "arn:aws:kms:us-east-2:200591809096:key/mrk-214252e743b743a296fdbb3b9f917392"
    }
  ],
  "chain": "flow-mainnet"
}
```

A separate staking-side smoke test is not run — the AWS → flow-cli → on-chain verifier chain is already proven end-to-end by Step 2 against the same KMS key material; the pubkey is identical on staking, only the chain-side index differs.

## Follow-up ceremonies (NOT in this PR)

1. Add Foundation key 2's AWS pubkey (`a5acfad4...`) to both chain accounts, smoke-test, revoke the current GCP key at service idx 13 / staking idx 7 (not shared — safe to revoke immediately after smoke test).
2. Add Foundation key 3's AWS pubkey (`3abfe3bc...`) to both chain accounts, smoke-test.
3. Revoke the shared GCP key at service idx 12 / staking idx 6 — safe once both co-holders have working AWS keys.

## Results

Step 1 (service AddKey) transaction: TBD
Step 2 (service smoke test) transaction: TBD
Step 3 (staking AddKey) transaction: TBD
