# FlowToken and FlowEVMBridgeCustomAssociations contract updates

Transactions to upgrade FlowToken, FlowEVMBridgeCustomAssociations and FlowEVMBridgeHandlerInterfaces contracts

Signer:

| Contract                        | Signer             | Address            |
|---------------------------------|--------------------|--------------------|
| FlowToken                       | FlowToken Account  | 0x1654653399040a61 |
| FlowEVMBridgeCustomAssociations | EVM Bridge Account | 0x1e4aa0b87d10b141 |


## Steps to update

### FlowToken

1. `wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/FlowToken.cdc`
2. `flow accounts update-contract ./FlowToken.cdc -n mainnet -f flow-staking.json --signer 0x1654653399040a61`

### FlowEVMBridgeCustomAssociations
1. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/FlowEVMBridgeCustomAssociations.cdc`
2. `flow accounts update-contract ./FlowToken.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

___

### Results

