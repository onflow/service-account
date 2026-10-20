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
2. `flow accounts update-contract ./FlowEVMBridgeCustomAssociations.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

___

### Results

Successful attempt:

1. Contract upgrade for FlowToken:
https://www.flowscan.io/tx/ec7c9c4dc680c26b43044e5726ca5b27e4fab3287e6b736975301a13e37be425

2. Contract upgrade for FlowEVMBridgeCustomAssociations
https://www.flowscan.io/tx/6731cfa7000156fe7713745ad647a9cba1f25d6b833eca4485d4aac9b81d12ae

