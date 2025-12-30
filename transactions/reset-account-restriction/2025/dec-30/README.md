## Account un-restriction for Dec-30

Arguments generated using:
python3 remove_restricted.py ../dec-29/arguments.json to_remove.txt -o arguments.json


```shell
$ python3 remove_restricted.py ../dec-29/arguments.json to_remove.txt -o arguments.json
Scanned 1 top-level arguments.
Scanned 1055 entries inside Array arguments.
Removed 126 Address entries.
Wrote: arguments.json
```

Check script output
```shell
jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' ../dec-29/arguments.json \
| sort > /tmp/old_addresses.csv

jq -r '.[]
  | select(.type=="Array")
  | .value[]
  | select(.type=="Address")
  | .value' arguments.json \
| sort > /tmp/new_addresses.csv

comm -23 /tmp/old_addresses.csv /tmp/new_addresses.csv

Should should only 126 entires

0x00d2f4e1f075ba37
0x02aaac9a9241e163
0x03c885827bf3c41b
0x0422abfe2fa2d20b
0x0547edad1634e8ad
0x057b5775f9b0d5df
0x065d9cce9db29681
0x085014322bb90ed3
0x0a283bbdc4527e9e
0x0bc47ca0d374f96c
0x0d70c11c8113f776
0x0dc50d7ecdf85c49
0x0ebf23858d5497f6
0x0f089967e327ac22
0x0fbb0a75533c98c2
0x1113980ca45d1d37
0x16ba2b0a86f58d24
0x195cfc547a23a643
0x1b91684d54fc5628
0x1c7b31c58d726b21
0x1c7c5e8e5d5674ff
0x1e4aa0b87d10b141
0x1f5a9535395437a1
0x200b491a25710604
0x276f7e97026b9987
0x2d200a5df778dd08
0x390c40e18197a724
0x3cf4a32e259a719f
0x3f0a2980c2e036c6
0x42c09b74b08640db
0x42fc21ac5f027da9
0x439967ff6694470f
0x43df8f2faebe613d
0x44fe3d9157770b2d
0x460c7eb380d51595
0x46bedd9a1c1aa174
0x4755823856c71241
0x488fefbe45950454
0x49d6133593870380
0x4a038bc8fe9be6ca
0x4d264c2a4c506bbc
0x4fecc08c3f74af10
0x513d5dd320472552
0x52d47ff6a2dffd6a
0x53f7d1755363e1fe
0x574166ba449eaff0
0x59c2f7b781debe31
0x5b722919d55461dd
0x5c6b5423881bd1d9
0x5e2989fda2e0530f
0x5ee7305533153347
0x62d6cf118318678e
0x6347c2bbee6bcffb
0x64d0a670c06ff66c
0x661a2ad6b34b32c0
0x69c2a4a0eeb1318e
0x6a7457b796dee457
0x6b36712e3cb9dd0b
0x6d30184f7fce4ce9
0x6d9daa00a0f3671d
0x6ea36862daf88f91
0x6ffa94e90cea8845
0x7072f53dc5cb05d3
0x727088ba0d8e6ede
0x7284c343596bfc0d
0x7492e2f9b4acea9a
0x7d62141da5bdd76a
0x8289d8f2f654a0cc
0x82f2bac1fd2e3b8d
0x86b176cc92e26751
0x87207b66ff91cf24
0x8b6966cd49f51a49
0x8c0a49ff3314b10d
0x8da51d7dff4b3151
0x8da7fe8db1e3240a
0x8f51c8f32d43ddd4
0x90e513ff0be66d30
0x922f9f5978c2a99c
0x92674150c9213fc9
0x9905adc0b447d7b5
0xa0550031b6ee4335
0xa0a14bc8e20bd1e6
0xa0db19c0c5a5caa6
0xa26bc76e912f154a
0xa30e813da8b92fec
0xa45114d73ddcb9da
0xa5073f04ab0c27c3
0xa5345284044a837c
0xa7fede22776e47d0
0xa941f5f75daa6b63
0xab8b79512e8eafcf
0xaefee5c4dd66bb4f
0xaf7b264ef159c7f3
0xb118183872a5f950
0xb1aabb11ee6a4db1
0xb4031885e7af2259
0xb43fa25d082b1f2b
0xb55ae40e31bd258d
0xb6478dd2e7c06f66
0xb80cedfe99e1d106
0xba322aa1be208779
0xba80898822ef3398
0xbac66158eac515aa
0xbf1590c4c4ae6102
0xbf6fc2cce3007a42
0xc0a70dbf59236752
0xc85b95980d64d06c
0xcb8d3f2695a6197b
0xcc6009e59c0c3bac
0xcd39f56e4a1e3c78
0xcffbbdeab1395be5
0xd0c9bb356cd4c1a3
0xddd95a150ca2131a
0xe04512233e58d2d4
0xe301f5bdee220a01
0xe3580c0b65fab326
0xe6437b427d2f4336
0xe7af3c5f6a09c4c4
0xe910178a40cde877
0xebdcb3a842c6981d
0xee48ed2b058c619f
0xef2c035e86a45b3e
0xf1fb596cf30dcea5
0xf33712a7eab315d0
0xfd88d69bdbc2927c
0xff431df209edfdc8
```
## Result:
Transaction ID: