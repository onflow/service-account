import FlowIDTableStaking from 0x8624b52f9ddcd04a
transaction(code: String) {

    prepare(stakingAccount: AuthAccount) {
      code.decodeHex()
    }
}
