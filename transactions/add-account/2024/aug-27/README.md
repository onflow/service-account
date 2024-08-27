# Create EVM GW & VM Bridge account
Create a new EVM Gateway & VM Bridge accounts and fund them with the provided amount of FLOW.

These two transactions will need to be executed separately with their respective args.

Bridge account creation:
https://www.flowdiver.io/tx/659150feaa8b8f37f62e6ade52d57a27d1f490338fc004bf0fa671d54a048745
Account created: 0x1e4aa0b87d10b141

GW account creation:
Failed: https://www.flowdiver.io/tx/00699a23b5026b449e747330971c91ae02e1009742c6b60504856245dc3883b8
Reason: [Error Code: 1103] error caused by: 1 error occurred: * storage limit check failed: [Error Code: 1103] The account with address (e467b9dd11fa00df) uses 3645833514 bytes of storage which is over its capacity (3373847051 bytes). Capacity can be increased by adding FLOW tokens to the account.

Successfull: https://www.flowdiver.io/tx/8d43e47904ccac4ddcea3e67d32f1204704dadb8719265d7f7a087bd393d86e7
Account created: 0xfa9fba4cf025057f