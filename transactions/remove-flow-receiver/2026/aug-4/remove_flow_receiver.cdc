import FungibleToken from 0xf233dcee88fe0abe

/// Removes the public FlowToken receiver capability from the metering settings
/// account (0xf426ff57ee8f6110):
///
/// 1. Unpublishes /public/flowTokenReceiver
/// 2. Deletes the underlying capability controller, fully revoking the capability
///
/// The metering settings account is keyless and is controlled via a
/// fully-entitled account capability stored in the service account at
/// /storage/meteringSettingsAccount.
///
/// See https://github.com/onflow/service-account/issues/458
transaction {

    let meteringAccount: auth(Capabilities) &Account
    let receiverCapabilityID: UInt64

    prepare(signer: auth(CopyValue) &Account) {
        let childAccount = signer.storage.copy<Capability<auth(Storage, Contracts, Keys, Inbox, Capabilities) &Account>>(from: /storage/meteringSettingsAccount)
            ?? panic("Could not find Metering Settings Account in storage")

        self.meteringAccount = childAccount.borrow()
            ?? panic("Could not borrow Metering Settings Account reference")

        // Record the ID of the published receiver capability so that its
        // controller can be deleted after unpublishing
        self.receiverCapabilityID = self.meteringAccount.capabilities
            .get<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
            .id
    }

    pre {
        self.meteringAccount.address == 0xf426ff57ee8f6110:
            "The account capability does not point to the metering settings account"
        self.meteringAccount.capabilities.get<&{FungibleToken.Receiver}>(/public/flowTokenReceiver).check():
            "No valid FlowToken receiver is published at /public/flowTokenReceiver on the metering settings account"
    }

    execute {
        // Unpublish the public receiver so no external account can deposit FLOW
        self.meteringAccount.capabilities.unpublish(/public/flowTokenReceiver)

        // Delete the capability controller to fully revoke the capability
        let controller = self.meteringAccount.capabilities.storage
            .getController(byCapabilityID: self.receiverCapabilityID)
            ?? panic("Could not find the capability controller for the FlowToken receiver")
        controller.delete()
    }

    post {
        !self.meteringAccount.capabilities.get<&{FungibleToken.Receiver}>(/public/flowTokenReceiver).check():
            "A FlowToken receiver is still published at /public/flowTokenReceiver on the metering settings account"
        self.meteringAccount.capabilities.storage.getController(byCapabilityID: self.receiverCapabilityID) == nil:
            "The capability controller for the FlowToken receiver was not deleted"
    }
}
