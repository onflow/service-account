# Set Deployment Allow List
> December 22nd, 2021

## New addition to the Deployment Allow List

- `0x329feb3ab062d289` - GigLabs
- `0xdc53ab155826d528` - Blocto

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_deployment_allow_list.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/deployment-allow-list/dec-22/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/deployment-allow-list/dec-22/deployment-allow-list-dec-22-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/41ce934a49be7e52852f2786f5e43e313ef0abadb5df23865abc92afb1d14a8b
