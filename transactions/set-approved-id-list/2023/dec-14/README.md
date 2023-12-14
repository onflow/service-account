# Add DapperLab node IDs

> Dec 14th, 2023

Figment to run 5 Consensus nodes for DapperLabs.

This is the transaction for the second cohort of 3 out of those 5 nodes.

Node Type | Total nodes
-------------|------------
Consensus    | 3

Node Type | Node ID
--------- |-----------------------------------------------------------------|
consensus| 5b2f9eaa692ce33b874b7460ddc59dd2ec0ae1aabeba450a2ab8f3c0c02fec22
consensus| 71b1ebea050e44127da030e02df820dbe18ae42675aef4d4366b32b7f8c3919f
consensus| 6beaa036315896bc9c0552d546ff10e2a637d53b8f847def8f1dba716ec33435



## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_approved_id_list.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%225b2f9eaa692ce33b874b7460ddc59dd2ec0ae1aabeba450a2ab8f3c0c02fec22%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%2271b1ebea050e44127da030e02df820dbe18ae42675aef4d4366b32b7f8c3919f%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%226beaa036315896bc9c0552d546ff10e2a637d53b8f847def8f1dba716ec33435%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Successful attempt: 
