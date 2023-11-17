# Set Safe DKG Threshold

> Nov 21st, 2023

Transaction to change the DKG threshold to 0.7.
Transaction template: [set_safe_threshold.cdc](../../../../templates/set_safe_threshold.cdc)

---
## Old method if the web tool does not work
## Flow Team builds

```sh
flow transactions build ./templates/set_safe_threshold.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-dkg-threshold/2022/feb-10/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-dkg-threshold/2022/feb-10/set-dkg-threshold-feb-10-sig-complete.rlp
```

## Results

Attempt 1 - Failed - https://flowscan.org/transaction/05b64b8350e028b30ce2432ef555b788cf1c4b192fc7ccad425cdb72cb862d7b
Attempt 2 - Success - https://flowscan.org/transaction/8aa8049ae72f675309cb74c313d17be79a1c19c637b42367e34fe65f0b389c1d