import FlowEpoch from 0x8624b52f9ddcd04a
import FlowIDTableStaking from 0x8624b52f9ddcd04a

transaction {
    prepare(signer: AuthAccount) {
        let heartbeat = signer.borrow<&FlowEpoch.Heartbeat>(from: FlowEpoch.heartbeatStoragePath)
            ?? panic("Could not borrow heartbeat from storage path")

        heartbeat.endStakingAuction()
    }
}