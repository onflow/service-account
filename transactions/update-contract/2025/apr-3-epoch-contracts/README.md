# Update Epoch contracts

Upgrade all 3 epoch contracts in exactly the following order. Before doing this step:
- Must have upgraded NodeVersionBeacon to v1.6.0
- Must have scheduled Protocol State Upgrade to v2

## 1. Upgrade FlowClusterQC

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

```
jq -n --arg name "FlowClusterQC" --arg value "$(xxd -p ./FlowClusterQC.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]'
```

Verified using:
```
cat upgrade-clusterqc-args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
diff /tmp/temp.txt FlowClusterQC.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): NA

Successful attempt: 


## 2. Upgrade FlowDKG

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

```
jq -n --arg name "FlowDKG" --arg value "$(xxd -p ./FlowDKG.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]'
```

Verified using:
```
cat upgrade-dkg-args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
diff /tmp/temp.txt FlowDKG.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): NA

Successful attempt: 

## 3. Upgrade FlowEpoch

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

```
jq -n --arg name "FlowEpoch" --arg value "$(xxd -p ./FlowEpoch.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]'
```

Verified using:
```
cat upgrade-epoch-args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
diff /tmp/temp.txt FlowEpoch.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): NA

Successful attempt: 
