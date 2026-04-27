# NodeVersionBeacon and RandomBeaconHistory contract update

Transactions to upgrade NodeVersionBeacon and RandomBeaconHistory contracts

Signer: Service Account `0xe467b9dd11fa00df`

## Transactions

[update contract](../../../../transactions/update-contract)

### NodeVersionBeacon

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/NodeVersionBeacon.cdc`

- Update imports

`cat "./NodeVersionBeacon.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-nvb-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt NodeVersionBeacon.cdc
(Should produce no difference)
```

### RandomBeaconHistory

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/RandomBeaconHistory.cdc`

- Update imports

`cat "./RandomBeaconHistory.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-rbh-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt RandomBeaconHistory.cdc
(Should produce no difference)
```

___

### Results

1. NodeVersionBeacon: https://www.flowscan.io/tx/28bdbb988b045af888ec133724462bc9287a01f42d820198777aede6db7790dc
2. RandomBeaconHistory: https://www.flowscan.io/tx/ca2bef34e4cfbcc7b1e8ce5a2f76dc977fce3312869f431ab69272eb4fafd38d