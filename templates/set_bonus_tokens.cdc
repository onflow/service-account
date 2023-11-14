
/// Saves an amount to storage that represent the amount
/// of bonus tokens that have yet to be burned
/// This amount is subtracted from the total supply of FLOW
/// whenever a new total rewards amount is calculated every epoch
/// because they are not meant to be a part of the total supply
/// 
/// Eventually, all bonus tokens will be burned and the amount will be zero
///
/// @param: bonusTokensBurned: the bonus tokens that were recently burned

transaction(bonusTokensBurned: UFix64) {

    prepare(signer: AuthAccount) {
        let existingBonusAmount = signer.load<UFix64>(from: /storage/FlowBonusTokenAmount)
            ?? panic("Could not load bonus token amount from storage")

        assert(
            existingBonusAmount >= bonusTokensBurned,
            message: "Tokens burned cannot be greater than the existing amount!"
        )

        signer.save(existingBonusAmount - bonusTokensBurned, to: /storage/FlowBonusTokenAmount)
    }
}