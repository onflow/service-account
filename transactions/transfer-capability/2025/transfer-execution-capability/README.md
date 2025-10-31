# Transfer FlowTransactionScheduler.SharedScheduler Capability

> Nov 4th, 2025

The service account should not be the authorizer of scheduled transactions, so we need to give a capability to a different account that will be a child account of the service account to be the one to execute scheduled transactions instead.

## Create New Account for Capability

The Service account (`e467b9dd11fa00df`) will be the payer and authorizer, signed by the service committee, for [create-execution-account](create-execution-account.cdc)

1. Creates the new account
2. Issues an `Execute`-entitled capability for `@FlowTransactionScheduler.SharedScheduler`
3. Stores the capability in the new account.
4. Creates a fully entitled `&Account` object for the new account.
5. Stores the Account object in the storage of the service account.

### Result:
https://www.flowscan.io/tx/
