# FungibleToken and StakingProxy update

Transactions to upgrade FungibleToken and StakingProxy contracts

Signer: 
1. Fungible Token: `0xf233dcee88fe0abe`
2. StakingProxy: `0x62430cf28c26d095`

## Transactions

[update contract](../../../../transactions/update-contract)

### FungibleToken

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-ft/refs/heads/master/contracts/FungibleToken.cdc`

- Update imports

`cat "./FungibleToken.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-fungibletoken-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FungibleToken.cdc
(Should produce no difference)
```

### StakingProxy

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/StakingProxy.cdc`

- Update imports

`cat "./StakingProxy.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-stakingproxy-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt StakingProxy.cdc
(Should produce no difference)
```


## Steps to upgrade

1. `flow transactions send ./templates/update_contract.cdc  --signer fungible_token --args-json "$(cat "./transactions/update-contract/2026/apr-20-part-2/arguments-fungibletoken-contract.json")" -n mainnet --compute-limit 9999`
2. `flow transactions send ./templates/update_contract.cdc  --signer staking_proxy --args-json "$(cat "./transactions/update-contract/2026/apr-20-part-2/arguments-stakingproxy-contract.json")" -n mainnet --compute-limit 9999`
___

### Results

1. FungibleToken:
   i. Success: https://www.flowscan.io/tx/26aec575a7aae0cc2676e2615ebe496642b25c4bb1e1548ad83a3da31ead24e2
2. StakingProxy:
   i. Failure: https://www.flowscan.io/tx/fcdb2001f42293f475be3465b8c5fa1ecc8d9890430ca2524b5678e1382350f4?tab=script - invalid signature
   ii. Success: https://www.flowscan.io/tx/da7471dbe45ade9e737d65e55a057aaa821c0624533bac3d987f44e1b103cd1e
   