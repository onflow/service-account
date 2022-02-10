# Set Safe DKG Threshold

> February 10th, 2022

## Dapper Labs Builds

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

https://flowscan.org/transaction/