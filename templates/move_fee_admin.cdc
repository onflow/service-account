import FlowFees from 0xf919ee77447b7497

transaction {

    prepare(owner: AuthAccount, receiver: AuthAccount) {

        // Link the staking admin capability to a private place
        let feesAdmin <- owner.load<@FlowFees.Administrator>(from: /storage/flowFeesAdmin)
            ?? panic("Could not load Fees admin from storage")

        // Save the capability to the receiver's account storage
        receiver.save(<-feesAdmin, to: /storage/flowFeesAdmin)
    }

}