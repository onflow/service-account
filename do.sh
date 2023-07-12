#!/bin/bash

git pull

flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-2.rlp \
	--config-path flow-staking.json \
	--signer find \
	--filter payload \
	--save ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-3.rlp

git add .
git commit -m "update staking contract for july-12"
git push origin main
