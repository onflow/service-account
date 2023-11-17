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
  --args-json "$(cat "./transactions/set-dkg-threshold/2023/nov-21/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-unsigned.rlp
```

## Signer 1 Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-unsigned.rlp \
  --config-path flow-staking.json \
  --signer <signer1> \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-1.rlp
```

## Signer 2 Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-1.rlp \
  --config-path flow-staking.json \
  --signer <signer1> \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-2.rlp
```

## Signer 3 Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-2.rlp \
  --config-path flow-staking.json \
  --signer <signer3> \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-3.rlp
```

## Signer 4 Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-3.rlp \
  --config-path flow-staking.json \
  --signer <signer4> \
  --filter payload \
  --save ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-dkg-threshold/2023/nov-21/set-dkg-threshold-nov-21-sig-complete.rlp
```

## Results
