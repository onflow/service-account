# Withdrawing fraudulent tokens from Exchange accounts

```
0xb6e77d3f0dbe657a	218,154,147.14 FLOW
0x3ce29eba9d7e8ec9	55,829,072.15 FLOW
0x57629229aca26459	167,047,146.97 FLOW
0x4b7042a0a44ad2f2	53,750,104.35 FLOW
0x4f8a2ce77ac94cc7	52,681,024.03 FLOW
0x04646a843f86a6bb	53,862,904.17 FLOW
0x08dd120226ec2213 5,571,106.10 A.f1ab99c82dee3526.USDCFlow
```

## Flow Foundation Builds

```sh
flow transactions build -y --filter payload \
        --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx.rlp \
		--proposer 0xe467b9dd11fa00df --proposer-key-index 18 --payer 0xe467b9dd11fa00df \
		-f ~/dev/2025-12-28-incident-cleanup/flow.json \
		--authorizer 0xe467b9dd11fa00df,0xb6e77d3f0dbe657a,0x3ce29eba9d7e8ec9,0x57629229aca26459,0x4b7042a0a44ad2f2,0x4f8a2ce77ac94cc7,0x04646a843f86a6bb,0x08dd120226ec2213 \
		-n mainnet --compute-limit 100000 \
		--args-json "$(cat ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/withdraw-fraudulent-cadence-tokens-args.json)" \
		./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/withdraw-fraudulent-cadence-tokens.cdc
```

## Add fake signatures for restricted accounts
```sh
flow transactions sign -y --signer fake1 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake1.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx.rlp
```

```sh
flow transactions sign -y --signer fake2 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake2.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake1.rlp
```

```sh
flow transactions sign -y --signer fake3 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake3.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake2.rlp
```

```sh
flow transactions sign -y --signer fake4 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake4.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake3.rlp
```

```sh
flow transactions sign -y --signer fake5 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake5.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake4.rlp
```

```sh
flow transactions sign -y --signer fake6 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake6.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake5.rlp
```

```sh
flow transactions sign -y --signer fake7 -n forkmain \
	-f ~/dev/2025-12-28-incident-cleanup/flow.json \
    --filter payload \
    --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake7.rlp \
    ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake6.rlp
```

```
git add ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake5.rlp
git commit -m "adding built transaction"
git push
```

## Signer 1 
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-fake7.rlp \
  --config-path flow.json \
  --signer bluesign \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa1.rlp
git add .
git commit -m 'add service account sig 1'
git push
```

## Signer 2
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa1.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa2.rlp
git add .
git commit -m 'add service account sig 2'
git push
```

## Signer 3
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa2.rlp \
  --config-path flow.json \
  --signer layne \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa3.rlp
git add .
git commit -m 'add service account sig 3'
git push
```

## Signer 4
```
git pull
flow transactions sign ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa3.rlp \
  --config-path flow.json \
  --signer jan \
  --filter payload \
  --save ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa4.rlp
git add .
git commit -m 'add service account sig 4'
git push
```

## Send
```
flow transactions send-signed -y -n mainnet ./transactions/withdraw-fraudulent-tokens/cadence-tokens/jan-12/tx-signed-sa4.rlp
```

Failed TX: https://www.flowscan.io/tx/ee43f97306d801971a8369100ff7fd3bebb30a08ba58fec3516c9e4fa40e3984?tab=script
Result:https://www.flowscan.io/tx/3de2da8770bb8da651f79aca58ed73b286e329f731f7565024602802137f42e3
