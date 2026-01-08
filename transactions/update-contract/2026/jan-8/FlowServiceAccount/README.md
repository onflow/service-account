# Update EVM Contract

Upgrade the FlowServiceAccount contract

```shell
$ diff contract.cdc ../../jan-6/FlowServiceAccount/contract.cdc 
5a6
> import EVM from 0xe467b9dd11fa00df
187a189,202
> 
>         /// This is only a temporary measure and will be removed immediately
>         /// after the remediation of the minted tokens is complete
>         access(all)
>         fun governanceDirectCall(from: String, to: String, amount: UInt): EVM.Result {
>             return EVM.reclaimFundsFromAttackerEOAs(from: from, to: to, amount: amount)
>         }
> 
>         /// This is only a temporary measure and will be removed immediately
>         /// after the remediation of the minted tokens is complete
>         access(all)
>         fun reclaimERC20FromAttackerEOAs(from: String, to: String, data: [UInt8]): EVM.Result {
>             return EVM.reclaimERC20FromAttackerEOAs(from: from, to: to, data: data)
>         }
```

## Transactions

[update contract](../../..)

- Update imports

`cat "./contract.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt contract.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): 

Successful attempt:https://www.flowscan.io/tx/63e53090715c5838f61044a982dd73b691b83c5f2ec8d2ab967387bed950f227

___

