/// Test script for remove_flow_receiver.cdc
///
/// Runs the same logic as the transaction using getAuthAccount(),
/// so it can be executed against live mainnet state without a multisig.
/// See ../../../../templates/test_script.cdc for the template.

import FungibleToken from 0xf233dcee88fe0abe

access(all) fun main() {

    // The service account
    let authorizer: Address = 0xe467b9dd11fa00df

    let signer = getAuthAccount<auth(CopyValue) &Account>(authorizer)

    // --- prepare ---

    let childAccount = signer.storage.copy<Capability<auth(Storage, Contracts, Keys, Inbox, Capabilities) &Account>>(from: /storage/meteringSettingsAccount)
        ?? panic("Could not find Metering Settings Account in storage")

    let meteringAccount = childAccount.borrow()
        ?? panic("Could not borrow Metering Settings Account reference")

    let receiverCapabilityID = meteringAccount.capabilities
        .get<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
        .id

    // --- pre-conditions ---

    assert(
        meteringAccount.address == 0xf426ff57ee8f6110,
        message: "The account capability does not point to the metering settings account"
    )
    assert(
        meteringAccount.capabilities.get<&{FungibleToken.Receiver}>(/public/flowTokenReceiver).check(),
        message: "No valid FlowToken receiver is published at /public/flowTokenReceiver on the metering settings account"
    )

    // --- execute ---

    // Unpublish the public receiver so no external account can deposit FLOW
    meteringAccount.capabilities.unpublish(/public/flowTokenReceiver)

    // Delete the capability controller to fully revoke the capability
    let controller = meteringAccount.capabilities.storage
        .getController(byCapabilityID: receiverCapabilityID)
        ?? panic("Could not find the capability controller for the FlowToken receiver")
    controller.delete()

    // --- post-conditions ---

    assert(
        !meteringAccount.capabilities.get<&{FungibleToken.Receiver}>(/public/flowTokenReceiver).check(),
        message: "A FlowToken receiver is still published at /public/flowTokenReceiver on the metering settings account"
    )
    assert(
        meteringAccount.capabilities.storage.getController(byCapabilityID: receiverCapabilityID) == nil,
        message: "The capability controller for the FlowToken receiver was not deleted"
    )
}
