import FlowIDTableStaking from 0x8624b52f9ddcd04a

/// This transaction increments the access node slot limit by additionalAccessSlots
/// Final access node slot limit will be current access node slot limit plus additionalAccessSlots

transaction(additionalAccessSlots: UInt16) {

    // Local variable for a reference to the ID Table Admin object
    let adminRef: &FlowIDTableStaking.Admin

    prepare(acct: auth(BorrowValue) &Account) {
        // borrow a reference to the admin object
        self.adminRef = acct.storage.borrow<&FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not borrow reference to staking admin")
    }

    execute {

        let slotLimits = FlowIDTableStaking.getRoleSlotLimits()

        let currentAccessSlotLimit = slotLimits[UInt8(5)]
          ?? panic("Could not get access node slot limit")

        slotLimits[UInt8(5)] = currentAccessSlotLimit + additionalAccessSlots

        // Set new access slot limits
        self.adminRef.setSlotLimits(slotLimits: slotLimits)
    }
}