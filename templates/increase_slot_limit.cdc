import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// Sets slots limits for each node role

transaction(role: UInt8, amountToIncrease: UInt16) {

    // Local variable for a reference to the ID Table Admin object
    let adminRef: &FlowIDTableStaking.Admin

    prepare(acct: auth(BorrowValue) &Account) {
        // borrow a reference to the admin object
        self.adminRef = acct.storage.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")
    }

    execute {

        // Initialize Candidate Node List
        let slotLimits: {UInt8: UInt16} = FlowIDTableStaking.getRoleSlotLimits()

        var limit = slotLimits[role] ?? panic("Could not get the limit for the specified role")
        limit = limit + amountToIncrease
        slotLimits[role] = limit

        adminRef.setSlotLimits(slotLimits: slotLimits)
    }
}
