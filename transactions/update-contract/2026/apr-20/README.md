# FlowClusterQC and FlowDKG update

Transactions to upgrade FlowClusterQC and FlowDKG contracts

Signer: Staking Account `0x8624b52f9ddcd04a`

## Transactions

[update contract](../../../../transactions/update-contract)

### FlowClusterQC

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/epochs/FlowClusterQC.cdc`

- Update imports

`cat "./FlowClusterQC.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-clusterqc-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowClusterQC.cdc
(Should produce no difference)
```

### FlowDKG

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/epochs/FlowDKG.cdc`

- Update imports

`cat "./FlowDKG.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-dkg-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowDKG.cdc
(Should produce no difference)
```

___

### Results

1. FlowClusterQC:https://www.flowscan.io/tx/75ae14666248a3d1abb161d9e791ba02d0bc0be10ce3145d305eccb6fe250191
2. FlowDKG: https://www.flowscan.io/tx/c1d689c69ac80e9aec4e22889c220ea679811e4ed28ca22773389451229b1406