# Set Deployment Allow List
> January 19th, 2022

## New addition to the Deployment Allow List

- `0xe25b725fe9369e17` - ZayCodes
- `0xc1db00a19de296e7` - Starly
- `0x396f2e50d6b15c6e` - Versus

## Dapper Labs Builds

```sh
flow transactions build ./../set_deployment_allow_list.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/deployment-allow-list/2022/jan-19/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/deployment-allow-list/2022/jan-19/deployment-allow-list-jan-19-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/41dc3f5c7bdf50f4e1d1682c515ddbb2ea272e6418e464dfa74b4605c8844eee
