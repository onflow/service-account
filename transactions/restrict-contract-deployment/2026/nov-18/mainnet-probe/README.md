# Mainnet deploy probe

Small sanity check used **before** and **after** the multisig in [`../`](../) to confirm, from a non-authorized account's point of view, whether the `isContractDeploymentRestricted` flag has actually taken effect on Mainnet.

Deploys a trivial empty contract from `vishalmainnet` (`0xcaa8b2e4800fbf12`) — an account the author owns outright (single key, weight 1000), which is **not** in `/storage/authorizedAddressesToDeployContracts` and therefore sees the same restriction any external developer would.

## How it reads

The script prints one of three lines at the end:

| Line | Meaning |
|---|---|
| `deploy SUCCEEDED → restriction is NOT active` | expected **before** the multisig lands |
| `deploy REJECTED → restriction IS active` | expected **after** the multisig lands |
| `ambiguous outcome — inspect CLI output above` | something unexpected; look at the CLI output |

## Config

The signer config and key live **outside the repo** (private key is inline-hex in that file). Default locations:

| Env var | Default | Purpose |
|---|---|---|
| `PROBE_CONFIG` | `/Users/vishal/testkey/flow.json` | `flow.json` containing the mainnet signer |
| `PROBE_SIGNER` | `vishalmainnet` | Account alias in that config |

Override either via env var if you want to run this from a different account.

## Before the multisig

```sh
./transactions/restrict-contract-deployment/2026/nov-18/mainnet-probe/run_probe.sh pre
```

Expected tail:

```
RESULT: deploy SUCCEEDED → restriction is NOT active
```

This proves the probe account can currently deploy and that the probe itself works.

### Pre-multisig run — Nov 18, 2026

Ran ahead of ceremony day to clear one step off the checklist.

| | |
|---|---|
| Transaction | [`3e94fada41998b6e5ea5086ddfb902475e300ed372c1b66646e70f662f37025e`](https://flowscan.org/transaction/3e94fada41998b6e5ea5086ddfb902475e300ed372c1b66646e70f662f37025e) |
| Deployed contract | `DeploymentProbe_pre_` on `0xcaa8b2e4800fbf12` (trailing `_` is a pre-fix leftover; subsequent runs produce clean names) |
| Probe account balance | 0.88911525 → 0.88509525 FLOW (−0.00402) |
| Sequence number | 187 → 188 |
| Outcome | `deploy SUCCEEDED → restriction is NOT active` ✅ (baseline confirmed) |

## After the multisig

```sh
./transactions/restrict-contract-deployment/2026/nov-18/mainnet-probe/run_probe.sh post
```

Expected tail:

```
RESULT: deploy REJECTED → restriction IS active
```

With a CLI error of the form:

```
(SetContract) is not authorized: deploying contracts requires authorization from specific accounts
```

## If the multisig is reverted

Re-run with a fresh tag (e.g. `postrevert`) to confirm the flag was flipped back off:

```sh
./transactions/restrict-contract-deployment/2026/nov-18/mainnet-probe/run_probe.sh postrevert
```

## Notes

- Each run uses a fresh contract name (`DeploymentProbe_<tag>`) so the attempt is always a brand-new deploy, not an update. Updates are unaffected by the restriction and would produce a misleading green signal.
- Successful runs leave a trivial empty contract on `0xcaa8b2e4800fbf12`. Removal is authorization-gated too, so these accumulate — safe to leave.
- Each successful run consumes a small amount of FLOW for fees + storage (<< 0.01 FLOW). The probe account had 0.88 FLOW at the time of writing.
