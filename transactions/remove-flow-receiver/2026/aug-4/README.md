# Remove Public FlowToken Receiver from the Metering Settings Account

> Date: August 4th 2026

Removes the public FlowToken receiver capability (`/public/flowTokenReceiver`)
from the metering settings account (`0xf426ff57ee8f6110`) and deletes its
capability controller, fully revoking the capability.

See issue [#458](https://github.com/onflow/service-account/issues/458).

Should be signed with the service account.

## Background

The metering settings account was created in
[transactions/add-account/2025/jan-21](../../../add-account/2025/jan-21/)
(issue [#353](https://github.com/onflow/service-account/issues/353)). It is
keyless and is controlled via a fully-entitled account capability stored in the
service account at `/storage/meteringSettingsAccount`. The FVM reads this
account's registers to compute the execution (metering) parameters.

Any write to a register in the meter-parameter read set causes the Execution
Nodes to invalidate the entire program cache (in flow-go, `ProgramInvalidator`:
"if meter parameters changed we need to invalidate all programs").

Because the account exposes a public FlowToken receiver, any external account
can deposit FLOW into it. That deposit touches the account's registers and can
intersect the meter-parameter read set, forcing a full program-cache reset on
the Execution Nodes. This is cheap to trigger and repeatable, making it an
unnecessary performance-degradation vector. The account has no need to receive
FLOW.

This completes the remaining cleanup item from
[onflow/flow-go#6894](https://github.com/onflow/flow-go/issues/6894).

## Scope

- Unpublishes `/public/flowTokenReceiver` and deletes its capability
  controller.
- The FlowToken vault in the account's storage (and its ~5 FLOW balance) is
  left untouched; it covers the account's storage deposit.
- `/public/flowTokenBalance` is left untouched; reading a balance does not
  write to the account's registers.

## Transaction to execute

[remove_flow_receiver.cdc](./remove_flow_receiver.cdc)

The transaction takes no arguments.

## Testing

The transaction logic can be tested against live mainnet state with
[test_script.cdc](./test_script.cdc) (scripts can use `getAuthAccount()`, so no
multisig is needed):

```bash
flow scripts execute transactions/remove-flow-receiver/2026/aug-4/test_script.cdc --network mainnet
```

## Verification

Run before and after the multisig:

```cadence
import FungibleToken from 0xf233dcee88fe0abe

access(all) fun main(): Bool {
    return getAccount(0xf426ff57ee8f6110)
        .capabilities.get<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
        .check()
}
```

- Before: `true`
- After: `false`

## Result

Transaction ID:https://www.flowscan.io/tx/22ee86bed3d3d2d27fd87edfed44e2f2648b5d7511042b9af365d03d7b1c8622
