import FlowIDTableStaking from 0x8624b52f9ddcd04a
import FlowEpoch from 0x8624b52f9ddcd04a
import FlowClusterQC from 0x8624b52f9ddcd04a
import FlowDKG from 0x8624b52f9ddcd04a

/// Transaction to move epoch admin resources from the staking
/// account to the service account

transaction(epochCode: String) {

    prepare(stakingAccount: AuthAccount, serviceAccount: AuthAccount) {

        stakingAccount.contracts.update__experimental(name: "FlowEpoch", code: epochCode.decodeHex())

        // move the staking admin to the service account
        let stakingAdmin <- stakingAccount.load<@FlowIDTableStaking.Admin>(from: FlowIDTableStaking.StakingAdminStoragePath)
            ?? panic("Could not load staking admin from staking account")

        // The service account already stores a staking admin capability, so load that first
        serviceAccount.load<Capability>(from: FlowIDTableStaking.StakingAdminStoragePath)

        serviceAccount.save(<-stakingAdmin, to: FlowIDTableStaking.StakingAdminStoragePath)

        // Create a private capability to the staking admin in the service account
        // and store it in the staking account
        let stakingAdminCapability = serviceAccount.link<&FlowIDTableStaking.Admin{FlowIDTableStaking.EpochOperations}>(
                /private/flowStakingAdminEpochOperations,
                target: FlowIDTableStaking.StakingAdminStoragePath
            ) ?? panic("Could not link Flow staking admin capability")

        stakingAccount.save(stakingAdminCapability, to: /storage/flowStakingAdminEpochOperations)

        // move the qc admin to the service account
        let qcAdmin <- stakingAccount.load<@FlowClusterQC.Admin>(from: FlowClusterQC.AdminStoragePath)
            ?? panic("Could not load qc admin from staking account")
        serviceAccount.save(<-qcAdmin, to: FlowClusterQC.AdminStoragePath)

        // Create a private capability to the qc admin in the service account
        // and store it in the staking account
        let qcAdminCapability = serviceAccount.link<&FlowClusterQC.Admin{FlowClusterQC.EpochOperations}>(
                /private/flowQCAdminEpochOperations,
                target: FlowClusterQC.AdminStoragePath
            ) ?? panic("Could not link Flow QC admin capability")

        stakingAccount.save(qcAdminCapability, to: /storage/flowQCAdminEpochOperations)


        // move the dkg admin to the service account
        let dkgAdmin <- stakingAccount.load<@FlowDKG.Admin>(from: FlowDKG.AdminStoragePath)
            ?? panic("Could not load dkg admin from staking account")
        serviceAccount.save(<-dkgAdmin, to: FlowDKG.AdminStoragePath)

        // Create a private capability to the dkg admin in the service account
        // and store it in the staking account
        let dkgAdminCapability = serviceAccount.link<&FlowDKG.Admin{FlowDKG.EpochOperations}>(
                /private/flowDKGAdminEpochOperations,
                target: FlowDKG.AdminStoragePath
            ) ?? panic("Could not link Flow DKG admin capability")

        stakingAccount.save(dkgAdminCapability, to: /storage/flowDKGAdminEpochOperations)

        // move the epoch admin
        let epochAdmin <- stakingAccount.load<@FlowEpoch.Admin>(from: FlowEpoch.adminStoragePath)
            ?? panic("Could not load epoch admin from staking account")
        serviceAccount.save(<-epochAdmin, to: FlowEpoch.adminStoragePath)

        // move the epoch heartbeat
        let epochHeartbeat <- stakingAccount.load<@FlowEpoch.Heartbeat>(from: FlowEpoch.heartbeatStoragePath)
            ?? panic("Could not load epoch heartbeat from staking account")
        serviceAccount.save(<-epochHeartbeat, to: FlowEpoch.heartbeatStoragePath)

    }
}
