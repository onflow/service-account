# Update Epoch contracts

Upgrade all 3 epoch contracts in exactly the following order. Before doing this step:
- Must have upgraded NodeVersionBeacon to v1.6.0
- Must have scheduled Protocol State Upgrade to v2 (and waited for activation view to successfully pass)

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

Successful attempt: https://www.flowscan.io/tx/b0c15c5c39f2c39f6f2790206034e79f6c25dfc2d1f44ab0fd2462159d81af4c


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

Successful attempt: https://www.flowscan.io/tx/caa8865bb164f8b6e4a69a7f2d393fc6543ad730b5aec3660b8021d813aab4df

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

Successful attempt: https://www.flowscan.io/tx/1e9d61e8bcbf1270e3ff1d243048e3b38b7472e0550b4f808c005aa2c753d3fd
