# Add contractor auditor privileges

> February 16, 2022

## Addresses in arguments, and their owners

- `0xfe011cd20b86c5c6` - Flow Solutions Eng team

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_contract_auditor.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-contract-auditor/2022/feb-16/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-contract-auditor/2022/feb-16/add-contract-auditor-feb-16-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/bceb3dd7c1f7ce313ee6dcdb9174d3f780e0e2ec95e6024f5007912b4f5b4d2c
