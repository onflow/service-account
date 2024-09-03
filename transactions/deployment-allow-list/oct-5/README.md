# Set Deployment Allow List
> October 5th, 2021

## New addition to the Deployment Allow List

`0xa07cc02cbabe237e` - Quantstamp

## Dapper Labs Builds

```sh
flow transactions build ./../set_deployment_allow_list.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/deployment-allow-list/oct-5/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/deployment-allow-list/oct-5/deployment-allow-list-oct-5-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/91a6e512eeac1b40a867e0a3f3a4923dc7d821fdd86e9350e0b70124e158b6cd
