# Add Approved Node Operators and increase Access node Slot Limit

> April 12th, 2023 

Adds Three Consensus nodes for QuickNode
1. `58f33a8c9d339ac9f3ba39a84a528f20d9c5f7c5cccb9d5f4f2c90af4def99aa`
2. `4afbd63916c3cec5bb75a34d607bcec3c670de952ed1556fa103c680b59b6215`
3. `6f270301fd6838293eca308472af43aed772f8ea7ad4adbd362535511cb09429`


## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_approved_id_list.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%2258f33a8c9d339ac9f3ba39a84a528f20d9c5f7c5cccb9d5f4f2c90af4def99aa%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%224afbd63916c3cec5bb75a34d607bcec3c670de952ed1556fa103c680b59b6215%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%226f270301fd6838293eca308472af43aed772f8ea7ad4adbd362535511cb09429%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Successful attempt: https://flowscan.org/transaction/9efc5dba7e5b4544b2677a783f98e2e445ceac76fb611479b462b6cdea9d3dce
