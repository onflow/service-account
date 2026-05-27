# Upgrade EVM Bridge related contracts, the LockedTokens contract and the FlowFees contract.

Transactions to upgrade the following contracts:

1. FlowEVMBridgeHandlerInterfaces
2. FlowEVMBridgeUtils
3. IFlowEVMNFTBridge
4. IFlowEVMTokenBridge
5. FlowEVMBridge
6. FlowEVMBridgeHandlers
7. FlowEVMBridgeAccessor
8. LockedTokens
9. FlowFees

## Signer:

1. For all FlowEVMBridge* contract, the signer is the EVM Bridge Account - `0x1e4aa0b87d10b141`.
2. For LockedToken contract, the signer is the `0x8d0e87b65159ae63` account.
3. For FlowFees contract, the signer is `0xf919ee77447b7497` account.


## Diffs
1. For FlowEVMBridge* contracts see this PR: https://github.com/onflow/flow-evm-bridge/pull/211
2. For LockedToken contract, see this PR: https://github.com/onflow/flow-core-contracts/pull/604/changes#diff-5dd4307bc3add5274c52ffe0077c3c220c556da949b8b40e7d497e202e4f6966
3. For FlowFees, see this PR: https://github.com/onflow/flow-core-contracts/pull/604/changes#diff-ad5b2b291a63223cdfb86944755cf77a8aa83134d4d5bfc500fe6061b63b2c54

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

9. FlowFees
   i. `wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/FlowFees.cdc`
   ii. `flow accounts update-contract ./FlowFees.cdc -n mainnet -f flow-staking.json --signer 0xf919ee77447b7497`

___

## Results

1. FlowEVMBridgeHandlerInterfaces:
    - https://www.flowscan.io/tx/6ec52c3a7da2468fd17c6b85ba2a8fabf0699e340bcac1e226a94c9f227c65a4
2. FlowEVMBridgeUtils:
    - https://www.flowscan.io/tx/b90806e4773fb5550d34ee718f199d0463938f0d3269d3862669b8ed826b8881
3. IFlowEVMNFTBridge:
    - https://www.flowscan.io/tx/ca0af4a71943223e81415e2ac2c0f1ce51876b3f33e13c8a7f6fb0c8e8365351
4. IFlowEVMTokenBridge:
    - https://www.flowscan.io/tx/3e8d19ca8cb4f3da41aba9311e76576d51d67336d52eaaa238424ca966e54526
5. FlowEVMBridge:
    - https://www.flowscan.io/tx/c0f36e3e6d968aee355335106bc632fb927c2997ae7e47540650f219913f362d
6. FlowEVMBridgeHandlers:
    - https://www.flowscan.io/tx/9a96750d9df1eaa8476c0c5079c02023df0cd3009384cc062451818df2288360
7. FlowEVMBridgeAccessor:
    - https://www.flowscan.io/tx/809506950cbf5b0f1ae01310f67ae99f6e15a97b3825b838c2c8fb7db8630f9a
8. LockedTokens:
    - https://www.flowscan.io/tx/fd2b696227d97feaa30daaf37ae3b48f1d61d59445ae95cb183e591e7efc5757
9. FlowFees:
    - https://www.flowscan.io/tx/1fe387d45a0ade030a4cee5043835a8dfb45e65037ff44ca33266dc68bb30cef
