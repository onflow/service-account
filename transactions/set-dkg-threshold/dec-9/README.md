# Set Safe DKG Threshold

> December 9th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_safe_threshold.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-dkg-threshold/dec-9/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-dkg-threshold/dec-9/set-dkg-threshold-dec-9-sig-complete.rlp
```

## Results

Failed - https://flowscan.org/transaction/9e98057038c499dcac45c80decb25956c30fec18d1c5477bbb2aa926c5f6a1a5
