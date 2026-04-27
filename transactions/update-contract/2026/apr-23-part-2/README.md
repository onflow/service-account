# EVM and FlowIDTableStaking contract update

Transactions to upgrade EVM and FlowIDTableStaking contracts

Signer:
1. EVM contract: Service Account `0xe467b9dd11fa00df`
2. FlowIDTableStaking contract: Staking Account `0x8624b52f9ddcd04a`

## Transactions

[update contract](../../../../transactions/update-contract)

### EVM

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-go/refs/heads/master/fvm/evm/stdlib/contract.cdc`

- Update imports

`cat "./contract.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-evm-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt contract.cdc
(Should produce no difference)
```

### FlowIDTableStaking

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/FlowIDTableStaking.cdc`

- Update imports

`cat "./FlowIDTableStaking.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-staking-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowIDTableStaking.cdc
(Should produce no difference)
```

___

### Results

1. EVM: https://www.flowscan.io/tx/de3ef94060f931f46ac065054ed43ee3644b2f7698f14e3e91385b143bfd9ad5
2. FlowIDTableStaking: https://www.flowscan.io/tx/3074d8af08394fe09b3865d1a91395792eb3fb2c9f9c222b108fa7a2f2e0dd2c