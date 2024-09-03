# Set Claimed

> September 14, 2021
## Dapper Labs Builds

```sh
flow transactions build ./set_claimed.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-unsigned.rlp
```

### Blocto Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-1.rlp
```

### Animoca Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-2.rlp
```

### Peter Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-3.rlp
```

### Kan Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/staking-contract-upgrade/set-claimed/set-claimed-sept-14-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/933f05bf8781b943899ac6c2767ffc8f8439de0b374893b8d8e20331f3c70a3c