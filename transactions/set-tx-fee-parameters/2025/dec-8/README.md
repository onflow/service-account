# FLIP 351: Transaction Fee Update to Enable Inflation-Neutral Tokenomics

> Dec 8th, 2025

- Set `surgeFactor` to `1.0` (unchanged)
- Set `inclusionEffortCost` to `0.0001` (100x of the current value)
- Set `executionEffortCost` to `4000` (current value: `24.99249924`, target value is 0.00004 and setting this to 0.00004 * 1e8)

Transaction to execute: [set_execution_effort_weights.cdc](../../../../templates/set_tx_fee_parameters.cdc)

Sign with service account

## Result

## Failed attempts

1. https://www.flowscan.io/tx/74d5eea750d19dd8ddeb9d20ace218065463619772ca287d88371fb06cab86de
    Reason: Incorrect argument format (`4000` instead of `4000.0`)

2. https://www.flowscan.io/tx/403ce52dc71e1b4b20a4e5d3d6d7b48676633f00840cf8d53aacc503f0109783
   Reason: signed using service account but should have used staking account.

## Successful attempt

3. https://www.flowscan.io/tx/ff47d71a1af25457d3f6fd4ca065c7cc7e9aa072dbf1068e869541bfe82fef89
