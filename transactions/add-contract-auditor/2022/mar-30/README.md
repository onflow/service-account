# Add contractor auditor privileges

> March 30th, 2022

## Addresses in arguments, and their owners

- `0x06b8336f29face9e` - Josh Hannan
- `0x38391285cd7d45bb` - Satyam Agrawal

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_contract_auditor_hard_coded.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-contract-auditor/2022/mar-30/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-contract-auditor/2022/mar-30/add-contract-auditor-mar-30-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
