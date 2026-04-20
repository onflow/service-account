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

1. `flow transactions send ./templates/update_contract.cdc  --signer fungible_token --args-json "$(cat "./arguments-fungibletoken-contract.json")" -n mainnet --compute-limit 9999`
2. `flow transactions send ./templates/update_contract.cdc  --signer staking_proxy --args-json "$(cat "./arguments-stakingproxy-contract.json")" -n mainnet --compute-limit 9999`
___

### Results

1. FungibleToken:
2. StakingProxy: