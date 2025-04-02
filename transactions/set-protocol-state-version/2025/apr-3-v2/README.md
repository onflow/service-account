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

Transaction ID: 
