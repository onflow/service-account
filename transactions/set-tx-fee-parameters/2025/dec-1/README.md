# FLIP 351: Transaction Fee Update to Enable Inflation-Neutral Tokenomics

# This is the Testnet transaction

> Dec 1st, 2025

- Set `surgeFactor` to `1.0` (unchanged)
- Set `inclusionEffortCost` to `0.0001` (100x of the current value)
- Set `executionEffortCost` to `4000` (current value: `24.99249924`, target value is 0.00004 and setting this to 0.00004 * 1e8)

Transaction to execute: [set_execution_effort_weights.cdc](../set_tx_fee_parameters_testnet.cdc)

Sign with service account

## Result

Txn ID:
