# Move Fees Admin

> September 14, 2021

## Dapper Labs Builds

```sh
flow transactions build ./move_fees_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-unsigned.rlp
```

## Staking Account Signatures

### Blocto Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-1.rlp
```

### Animoca Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-2.rlp
```

### Peter Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-3.rlp
```

### Kan Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-4.rlp
```

## Service Account Signatures

### Blocto Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-4.rlp \
  --config-path flow.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-5.rlp
```

### Animoca Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-5.rlp \
  --config-path flow.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-6.rlp
```

### Peter Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-6.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-7.rlp
```

### Kan Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-7.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/staking-contract-upgrade/move-fees-admin/move-fees-admin-sept-14-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/ee153b3590dfe979d8391ebbd4011ce22d1b8eed484ad648e486da9c93c64e9e
