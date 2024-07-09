/**
  Create multiple new Auditor resource in the admin storage and deposit
  a linked capability to the provided Auditors' account. 
  This mechanism enables the administrator to revoke audit access 
  by deleting the resource or capability.
  Before running this transaction, all auditors should have initialized their 
  accounts with auditor/init.cdc
*/

import FlowContractAudits from 0xe467b9dd11fa00df

transaction(newAuditors: [{String: AnyStruct}]) {

    prepare(adminAccount: AuthAccount) {       
        
        // Get a reference to the admin resource
        let adminRef = adminAccount.borrow<&FlowContractAudits.Administrator>(from: FlowContractAudits.AdminStoragePath)
            ?? panic("Could not borrow a reference to the admin resource")

        for newAuditor in newAuditors {
            
            let newAuditorAddress = newAuditor["address"]! as! Address
            let newAuditorAdminResourceStoragePath = newAuditor["adminResourceStoragePath"]! as! StoragePath
            let newAuditorAdminCapabilityPrivatePath = newAuditor["adminCapabilityPrivatePath"]! as! PrivatePath

            // Create new Auditor and link it to admin storage
            let auditor <- adminRef.createNewAuditor()
            adminAccount.save(<- auditor, to: newAuditorAdminResourceStoragePath)
            let auditorCapability = adminAccount.link<&FlowContractAudits.Auditor>(
                newAuditorAdminCapabilityPrivatePath, target: newAuditorAdminResourceStoragePath
            ) ?? panic("Could not link auditor")

            // Deposit capability into new auditor's account
            let auditorAccount = getAccount(newAuditorAddress)
            let capabilityReceiver = auditorAccount.getCapability
                <&FlowContractAudits.AuditorProxy{FlowContractAudits.AuditorProxyPublic}>
                (FlowContractAudits.AuditorProxyPublicPath)!
                .borrow() ?? panic("Could not borrow capability receiver reference")
            capabilityReceiver.setAuditorCapability(auditorCapability)   

        }   
    }
}