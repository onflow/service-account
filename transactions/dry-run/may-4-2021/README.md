# Flow Service Account

*All commands assumes terminal is at the root of this repository.*

## Install

```sh
brew install flow-cli
```

## Build

```sh
flow transactions build templates/hello.cdc \
  --network mainnet \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 7 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save transactions/dry-run/may-4-2021/hello1.rlp
```

## Blocto Signs

```sh
flow transactions sign transactions/dry-run/may-4-2021/hello1.rlp \
  --signer blocto \
  --filter payload \
  --save transactions/dry-run/may-4-2021/hello2.rlp
```

## Equilibrium Signs

```sh
flow transactions sign transactions/dry-run/may-4-2021/hello2.rlp \
  --signer equilibrium \
  --filter payload \
  --save transactions/dry-run/may-4-2021/hello3.rlp
```

## Ichi Signs

```sh
flow transactions sign transactions/dry-run/may-4-2021/hello3.rlp \
  --signer ichi \
  --filter payload \
  --save transactions/dry-run/may-4-2021/hello4.rlp
```

## Animoca Signs

```sh
flow transactions sign transactions/dry-run/may-4-2021/hello4.rlp \
  --signer animoca \
  --filter payload \
  --save transactions/dry-run/may-4-2021/hello5.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet transactions/dry-run/may-4-2021/hello5.rlp
```
