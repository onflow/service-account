
/// Set the bonus tokens to zero.
/// The reward calculation should be based on the total without subtracting any bonus tokens
/// of bonus tokens that have yet to be burned
transaction() {

    prepare(signer: AuthAccount) {
        let existingBonusAmount = signer.load<UFix64>(from: /storage/FlowBonusTokenAmount)
            ?? panic("Could not load bonus token amount from storage")


        signer.save(0.0, to: /storage/FlowBonusTokenAmount)
    }
}