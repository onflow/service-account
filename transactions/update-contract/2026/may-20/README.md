# Upgrade EVM Bridge related contracts and the LockedTokens contract.

Transactions to upgrade the following contracts:

1. FlowEVMBridgeHandlerInterfaces
2. FlowEVMBridgeUtils
3. IFlowEVMNFTBridge
4. IFlowEVMTokenBridge
5. FlowEVMBridge
6. FlowEVMBridgeHandlers
7. FlowEVMBridgeAccessor
8. LockedTokens

## Signer:

1. For all FlowEVMBridge* contract, the signer is the EVM Bridge Account - `0x1e4aa0b87d10b141`.
2. For LockedToken contract, the signer is the `0x8d0e87b65159ae63`


## Diffs
1. For FlowEVMBridge* contracts see this PR: https://github.com/onflow/flow-evm-bridge/pull/211
2. For LockedToken contract, see this PR: https://github.com/onflow/flow-core-contracts/pull/604/changes#diff-5dd4307bc3add5274c52ffe0077c3c220c556da949b8b40e7d497e202e4f6966

## Steps to update

1.  FlowEVMBridgeHandlerInterfaces
    i. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/interfaces/FlowEVMBridgeHandlerInterfaces.cdc`
    ii. `flow accounts update-contract ./FlowEVMBridgeHandlerInterfaces.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

2.  FlowEVMBridgeUtils
    i. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/FlowEVMBridgeUtils.cdc`
    ii. `flow accounts update-contract ./FlowEVMBridgeUtils.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

3.  IFlowEVMNFTBridge
    i. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/interfaces/IFlowEVMNFTBridge.cdc`
    ii. `flow accounts update-contract ./IFlowEVMNFTBridge.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

4.  IFlowEVMTokenBridge
    i. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/interfaces/IFlowEVMTokenBridge.cdc`
    ii. `flow accounts update-contract ./IFlowEVMTokenBridge.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

5.  FlowEVMBridge
    i. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/FlowEVMBridge.cdc`
    ii. `flow accounts update-contract ./FlowEVMBridge.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

6.  FlowEVMBridgeHandlers
    i. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/FlowEVMBridgeHandlers.cdc`
    ii. `flow accounts update-contract ./FlowEVMBridgeHandlers.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

7.  FlowEVMBridgeAccessor
    i. `wget https://raw.githubusercontent.com/onflow/flow-evm-bridge/refs/heads/main/cadence/contracts/bridge/FlowEVMBridgeAccessor.cdc`
    ii. `flow accounts update-contract ./FlowEVMBridgeAccessor.cdc -n mainnet -f flow-staking.json --signer 0x1e4aa0b87d10b141`

8. LockedTokens 
    i. `wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/LockedTokens.cdc`
    ii. `flow accounts update-contract ./LockedTokens.cdc -n mainnet -f flow-staking.json --signer 0x8d0e87b65159ae63`

___

## Results

1. FlowEVMBridgeHandlerInterfaces:
2. FlowEVMBridgeUtils:
3. IFlowEVMNFTBridge:
4. IFlowEVMTokenBridge:
5. FlowEVMBridge:
6. FlowEVMBridgeHandlers:
7. FlowEVMBridgeAccessor:
8. LockedTokens:




