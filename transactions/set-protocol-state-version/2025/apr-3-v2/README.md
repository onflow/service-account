# Upgrade Protocol State

This is Step 2 in the Apr 3 2025 Protocol State Upgrade Process. Before doing this step:
- Must have upgraded NodeVersionBeacon to v1.6.0

[set protocol state version](../../../../templates/set_protocol_state_version.cdc)

To produce arguments:
```
jq -n --arg version "2" --arg view "TODO" '[{"type":"UInt64","value":$version},{"type":"UInt64","value":$view}]'
```

We will definitely be using version 2, but will need to determine the view on the day.

## Result

Failed attempt: https://www.flowscan.io/tx/6d500edfa39d572c6b6069feaad64a194ed959ed1bf046f8c1a2af2d6deb7799 (used staking account instead of service account for signing)

Transaction ID: https://www.flowscan.io/tx/49069b2c87d4734e1510e120b2084a083cf24a0e54de595281d4e61e4c4d2719
