## Flow Foundation Builds

```sh
flow transactions build -y --filter payload \
        --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx.rlp \
		--proposer 0xe467b9dd11fa00df --proposer-key-index 12 --payer 0xe467b9dd11fa00df \
		-f ~/dev/2025-12-28-incident-cleanup/flow.json \
		--authorizer 0xe467b9dd11fa00df,0xfd595328d97d33d5,0x2ef3addd3d2fdcb2,0x876d79eb09383877,0x1d84e60dc3a2f0c7 -n mainnet --compute-limit 1000 \
		--args-json "$(cat ./transactions/withdraw-fraudulent-tokens/cadence-tokens/withdraw-fraudulent-cadence-tokens-args.json)" \
		./transactions/withdraw-fraudulent-tokens/cadence-tokens/withdraw-fraudulent-cadence-tokens.cdc
```

## Add fake signatures for restricted accounts
```sh
flow transactions sign -y --signer fake1 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake1.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx.rlp
```

```sh
flow transactions sign -y --signer fake2 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake2.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake1.rlp
```

```sh
flow transactions sign -y --signer fake3 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake3.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake2.rlp
```

```sh
flow transactions sign -y --signer fake4 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake4.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake3.rlp
```

```
git add ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake4.rlp
git commit -m "adding built transaction"
git push
```

## Signer 1 
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-fake4.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa1.rlp
git add .
git commit -m 'add service account sig 1'
git push
```

## Signer 2
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa1.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa2.rlp
git add .
git commit -m 'add service account sig 2'
git push
```

## Signer 3
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa2.rlp \
  --config-path flow.json \
  --signer jan \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa3.rlp
git add .
git commit -m 'add service account sig 3'
git push
```

## Signer 4
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa3.rlp \
  --config-path flow.json \
  --signer bluesign \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa4.rlp
git add .
git commit -m 'add service account sig 4'
git push
```

## Send
```
flow transactions send-signed -y -n mainnet ./transactions/withdraw-fraudulent-tokens/cadence-tokens/tx-signed-sa4.rlp
```