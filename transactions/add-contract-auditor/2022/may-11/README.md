# Add contractor auditor privileges

> May 11th, 2022

## Addresses in arguments, and their owners

- `0xd66fa9f87170c7d3` - QuantStamp
- `0xceaa7dac7981d3d3` - OakSecurity

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_contract_auditor_v2.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-contract-auditor/2022/may-11/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-contract-auditor/2022/may-11/add-contract-auditor-may-11-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
