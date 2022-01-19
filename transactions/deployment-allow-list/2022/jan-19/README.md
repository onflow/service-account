# Set Deployment Allow List
> January 19th, 2022

## New addition to the Deployment Allow List

- `0xe25b725fe9369e17` - ZayCodes
- `0xc1db00a19de296e7` - Starly
- `0x396f2e50d6b15c6e` - Versus

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_deployment_allow_list.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/deployment-allow-list/2022/jan-19/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-dec-22-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
