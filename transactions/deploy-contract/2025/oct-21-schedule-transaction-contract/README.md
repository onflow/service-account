# Deploy the FlowTransactionScheduler and FlowTransactionSchedulerUtils contracts

> Oct 21st, 2025

Deploy the [FlowTransactionScheduler](https://github.com/onflow/flow-core-contracts/blob/master/contracts/FlowTransactionScheduler.cdc) and [FlowTransactionSchedulerUtils](https://github.com/onflow/flow-core-contracts/blob/master/contracts/FlowTransactionSchedulerUtils.cdc) contracts under the service account.

## Transactions
1. FlowTransactionScheduler
   i. `cd transactions/deploy-contract/2025/oct-21-schedule-transaction-contract`
   ii. Download the contract from flow-core-contract git repo: `wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/FlowTransactionScheduler.cdc`
   iii. Update the imports to the actual address on mainnet.
   iv. Generate the contract code arguments: `cat "./FlowTransactionScheduler.cdc" | xxd -p | tr -d '\n'` and create the `arguments-deploy-transaction-scheduler.json`
   v. Verify arguments:
   ```
   $ cat arguments-deploy-transaction-scheduler.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
   $ diff /tmp/temp.txt FlowTransactionScheduler.cdc
   (Should produce no difference)
   ```
   vi. Submit the [Deploy contract](../../../../templates/deploy_contract.cdc) transaction with these arguments.

2. FlowTransactionSchedulerUtils
   i. `cd transactions/deploy-contract/2025/oct-21-schedule-transaction-contract`
   ii. Download the contract from flow-core-contract git repo: `wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/FlowTransactionSchedulerUtils.cdc`
   iii. Update the imports to the actual address on mainnet.
   iv. Generate the contract code arguments: `cat "./FlowTransactionSchedulerUtils.cdc" | xxd -p | tr -d '\n'` and create the `arguments-deploy-transaction-scheduler-utils.json`
   v. Verify arguments:
   ```
   $ cat arguments-deploy-transaction-scheduler-utils.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
   $ diff /tmp/temp.txt FlowTransactionSchedulerUtils.cdc
   (Should produce no difference)
   ```
   vi. Submit the [Deploy contract](../../../../templates/deploy_contract.cdc) transaction with these arguments.

___

### Results

Unsuccessful attempt (if any):

Successful attempt:

___

