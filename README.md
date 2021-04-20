# Flow Service Account

## Install

```sh
brew install flow-cli
```

## Build

```sh
flow transactions build hello.cdc \
  --network mainnet \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 1 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save hello1.rlp
```

## Dete Signs

```sh
flow transactions sign hello1.rlp \
  --signer dete \
  --filter payload \
  --save hello2.rlp
```

## Kan Signs

```sh
flow transactions sign hello2.rlp \
  --signer kan \
  --filter payload \
  --save hello3.rlp
```

## Alex Signs

```sh
flow transactions sign hello3.rlp \
  --signer alex \
  --filter payload \
  --save hello4.rlp
```

## Peter Signs

```sh
flow transactions sign hello4.rlp \
  --signer peter \
  --filter payload \
  --save hello5.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet hello5.rlp
```
