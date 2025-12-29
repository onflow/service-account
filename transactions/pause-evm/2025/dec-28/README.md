# Pause EVM Bridge and Upgrade EVM Contract

> Dec 28th, 2025

For the Flow network upgrade to rectify the accounts after the Dec 27th hack, all EVM operations need to be completely disabled until the fraudulent tokens have been dealt with.

## Transaction 1 - Pause Bridge

Running this transaction will pause the [`FlowEVMBridge`](httpss://github.com/onflow/flow-evm-bridge) contracts, blocking all bridging operations until the contract is unpaused.

Uses the [pause_evm.cdc transaction](./pause_evm.cdc), signed by the EVM bridge account.

## Transaction 2 - Upgrade EVM contract

Using [update-contract](./../../../../templates/update_contract.cdc), we will upgrade the `EVM` contract to block all state-changing operations with Flow-EVM.

Used this to generate the contract code arguments:

jq -n --arg name "EVM" --arg value "$(xxd -p ./EVM.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-EVM.json

Verified using:
```
$ cat arguments-EVM.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt EVM.cdc
(Should produce no difference)
```

[Site](https://flow-multisig-git-service-account-onflow.vercel.app/)

## Results