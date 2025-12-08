/// This is a templates for a script that can be used
/// to test any transaction that we're planning to submit with the service account or staking account
///
/// In order to use this template, you'll need to:
/// 1. Include all the imports from the transaction that you're planning to test
/// 2. Replace the script's parameters with the actual parameters that you're planning to test
/// 3. Add the account that you're planning on authorizing with
/// 4. Make sure that getAuthAccount() uses the correct entitlements from your transaction
/// 5. Update the rest of the body of the script to have the same logic as the transaction
///

/// Replace this with your transaction's imports
/// import "CONTRACT"

/// Include your transaction's parameters here
access(all) fun main() {

    // Add the authorizer's address here
    // Typically this is the the service account address
    // so it is provided here by default
    let authorizer: Address = 0xe467b9dd11fa00df
    
    // Add the account entitlements you need in the `auth()` parentheses
    let signer = getAuthAccount<auth(BorrowValue) &Account>(authorizer)

    // Add the transaction logic here, using `signer` as the authorizer
}
