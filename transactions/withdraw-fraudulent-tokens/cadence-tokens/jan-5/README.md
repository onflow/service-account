# Withdrawing fraudulent tokens from Exchange accounts

```
Gate:
0xb65cb9286d8eab6c: 160383532.66935754
0xdaab59a2823a4eed: 3401000.00000326
0xdbae64c84d4de3c6: 1280307.73063920

OKx
0x4c3e45954dc6b544: 161843947.23

MEXC
0xf45bc3eaaff3e3e9: 157526135.78241959
```

## Flow Foundation Builds

```sh
flow transactions build -y --filter payload \
        --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx.rlp \
		--proposer 0xe467b9dd11fa00df --proposer-key-index 12 --payer 0xe467b9dd11fa00df \
		-f ~/dev/2025-12-28-incident-cleanup/flow.json \
		--authorizer 0xe467b9dd11fa00df,0xb65cb9286d8eab6c,0xdaab59a2823a4eed,0xdbae64c84d4de3c6,0x4c3e45954dc6b544,0xf45bc3eaaff3e3e9 -n mainnet --compute-limit 100000 \
		--args-json "$(cat ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/withdraw-fraudulent-cadence-tokens-args.json)" \
		./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/withdraw-fraudulent-cadence-tokens.cdc
```

## Add fake signatures for restricted accounts
```sh
flow transactions sign -y --signer fake1 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake1.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx.rlp
```

```sh
flow transactions sign -y --signer fake2 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake2.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake1.rlp
```

```sh
flow transactions sign -y --signer fake3 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake3.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake2.rlp
```

```sh
flow transactions sign -y --signer fake4 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake4.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake3.rlp
```

```sh
flow transactions sign -y --signer fake5 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake5.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake4.rlp
```

```
git add ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake5.rlp
git commit -m "adding built transaction"
git push
```

## Signer 1 
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-fake5.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa1.rlp
git add .
git commit -m 'add service account sig 1'
git push
```

## Signer 2
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa1.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa2.rlp
git add .
git commit -m 'add service account sig 2'
git push
```

## Signer 3
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa2.rlp \
  --config-path flow.json \
  --signer layne \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa3.rlp
git add .
git commit -m 'add service account sig 3'
git push
```

## Signer 4
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa3.rlp \
  --config-path flow.json \
  --signer jan \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa4.rlp
git add .
git commit -m 'add service account sig 4'
git push
```

## Send
```
flow transactions send-signed -y -n mainnet ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-5/tx-signed-sa4.rlp
```

Result: https://www.flowscan.io/tx/
