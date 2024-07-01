/**

  Create a new Auditor resource in the admin storage and deposit
  a linked capability to the provided Auditor's account. 

  This mechanism enables the administrator to revoke audit access 
  by deleting the resource or capability.

  Before running this transaction, the auditor should have initialized their 
  account with auditor/init.cdc

*/

import FlowContractAudits from 0xe467b9dd11fa00df

// Grant Auditor access to a Flow Address
transaction {    
    let auditor1Capability: Capability<&FlowContractAudits.Auditor>
    let auditor2Capability: Capability<&FlowContractAudits.Auditor>

    prepare(adminAccount: AuthAccount) {

        // Create a reference to the admin resource in storage
        let auditorAdmin = adminAccount.borrow<&FlowContractAudits.Administrator>(from: FlowContractAudits.AdminStoragePath)
            ?? panic("Could not borrow a reference to the admin resource")        
        
        // Josh Hannan
        let auditor1ResourceStoragePath = /storage/FlowContractAudits_auditors_JoshHannan
        let auditor1CapabilityPrivatePath = /private/FlowContractAudits_auditors_JoshHannan

        let auditor1 <- auditorAdmin.createNewAuditor()
        adminAccount.save(<- auditor1, to: auditor1ResourceStoragePath)
        self.auditor1Capability = adminAccount.link<&FlowContractAudits.Auditor>(
            auditor1CapabilityPrivatePath, target: auditor1ResourceStoragePath
        ) ?? panic("Could not link auditor")

        // Satyam Agrawal
        let auditor2ResourceStoragePath = /storage/FlowContractAudits_auditors_SatyamAgrawal
        let auditor2CapabilityPrivatePath = /private/FlowContractAudits_auditors_SatyamAgrawal        
        
        let auditor2 <- auditorAdmin.createNewAuditor()
        adminAccount.save(<- auditor2, to: auditor2ResourceStoragePath)
        self.auditor2Capability = adminAccount.link<&FlowContractAudits.Auditor>(
            auditor2CapabilityPrivatePath, target: auditor2ResourceStoragePath
        ) ?? panic("Could not link auditor")
    }

    execute {
        // This is the account that the capability will be given to

        // Josh
        let auditor1Account = getAccount(0x06b8336f29face9e)

        let capabilityReceiver1 = auditor1Account.getCapability
            <&FlowContractAudits.AuditorProxy{FlowContractAudits.AuditorProxyPublic}>
            (FlowContractAudits.AuditorProxyPublicPath)!
            .borrow() ?? panic("Could not borrow capability receiver reference")

        capabilityReceiver1.setAuditorCapability(self.auditor1Capability)

        // Satyam
        let auditor2Account = getAccount(0x38391285cd7d45bb)

        let capabilityReceiver2 = auditor2Account.getCapability
            <&FlowContractAudits.AuditorProxy{FlowContractAudits.AuditorProxyPublic}>
            (FlowContractAudits.AuditorProxyPublicPath)!
            .borrow() ?? panic("Could not borrow capability receiver reference")

        capabilityReceiver2.setAuditorCapability(self.auditor2Capability)
    }

}
