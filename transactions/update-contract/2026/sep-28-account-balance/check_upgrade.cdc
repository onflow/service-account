import FlowServiceAccount from 0xe467b9dd11fa00df
import FlowStorageFees from 0xe467b9dd11fa00df

/// Post-upgrade sanity check: the protocol balance reads must match
/// `Account.balance` (canonical vault at /storage/flowTokenVault), not the
/// republishable /public/flowTokenBalance capability.
access(all) fun main(addr: Address): Bool {
    let acct = getAccount(addr)

    if FlowServiceAccount.defaultTokenBalance(acct) != acct.balance {
        return false
    }

    let expectedAvailable = acct.balance.saturatingSubtract(
        FlowStorageFees.defaultTokenReservedBalance(addr)
    )
    return FlowStorageFees.defaultTokenAvailableBalance(addr) == expectedAvailable
}
