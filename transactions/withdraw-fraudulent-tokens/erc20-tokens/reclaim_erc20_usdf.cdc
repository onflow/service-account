import EVM from 0xe467b9dd11fa00df
import FlowServiceAccount from 0xe467b9dd11fa00df

transaction(from: String, to: String, amount: UInt256) {
    let flowServiceAccountAdmin: &FlowServiceAccount.Administrator

    prepare(signer: auth(BorrowValue) &Account) {
        self.flowServiceAccountAdmin = signer.storage.borrow<&FlowServiceAccount.Administrator>(
            from: /storage/flowServiceAdmin
        ) ?? panic("Unable to borrow reference to administrator resource")
    }

    execute {
        let usdfContractAddress: String = "0x2aaBea2058b5aC2D339b163C6Ab6f2b6d53aabED"
        let toAddress: EVM.EVMAddress = EVM.addressFromString(to)
        let transferCallData: [UInt8] = EVM.encodeABIWithSignature(
            "transfer(address,uint256)",
            [toAddress, amount]
        )
        let txResult = self.flowServiceAccountAdmin.reclaimERC20FromAttackerEOAs(
            from: from,
            to: usdfContractAddress,
            data: transferCallData
        )

        assert(
            txResult.status == EVM.Status.successful,
            message: "evm_error=\(txResult.errorMessage);evm_error_code=\(txResult.errorCode)"
        )
    }
}