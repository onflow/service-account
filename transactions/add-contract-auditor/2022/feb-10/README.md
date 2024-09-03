# Add contractor auditor privileges

> February 10, 2022

## Addresses in arguments, and their owners

- `0xfe011cd20b86c5c6` - Flow Solutions Eng team

## Dapper Labs Builds

```sh
flow transactions build ./../add_contract_auditor.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-contract-auditor/2022/feb-10/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-contract-auditor/2022/feb-10/add-contract-auditor-feb-10-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/e3b7ef3603f9e96e27429e5c80b4e048ecf694b03386ceefa71e5f46d093aae9
