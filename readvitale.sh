#!/bin/bash
source def.sh

#curl -v -X POST "https://fsv.demo.stellair.fr/fsv/1.40.14/ssv/LireCartePS?terminalId=497490c4-84ae-4cd9-929a-999ab8079d70" -H "accept: application/json; charset=UTF-8" -H "accessHealthcareToken: eyJhbGciOiJFUzI1NiIsInppcCI6IkRFRiJ9.eJw9z0sOgjAQBuC7dA1kKlBaV8YTuPACQxl0FFoCJdEY7-6QqIvZfPnn9VK8LGqvcJo8hjg9VaaWtRVJNI8ccDjHOwXR0PZqr40tLZTOukwxph9Uuw3oMX3BgdngllgG9a03bdW5vNcAeQXY5c74Xa4bC4Q1uQatzEfvaTslzStl_-3SfwIAJ1XWjZPcEC8chEdM6cq0FgPNcUQOBw4XCuxj4eMoQXlspVmSAEcDWtelUe8P4ulGYw.8b0n4ZjNjS4Zz5FsIiFwwSt2pI4h72nuMXsZ5-AIt7ZO_yqob52a0DT7_sFTyciT_4AaFlfolY3vGuxZYH21lQ" -H "Authorization: Bearer eyJraWQiOiJha3lsdGVnQXNoQWdZVktUUTNmY1RWTVZkUmh5MUloTWZTKzhqM1UzdmFjPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIwYjRiYTFiMS1iYmQ3LTQ2ZWYtYjk2Mi0xN2VmMmI5OTczMTAiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuZXUtY2VudHJhbC0xLmFtYXpvbmF3cy5jb21cL2V1LWNlbnRyYWwtMV9SZnl3ODFnTHQiLCJ2ZXJzaW9uIjoyLCJjbGllbnRfaWQiOiI0dDNscTE0N3FlYjZhNzBlMGc3NXVxYWY1MCIsImV2ZW50X2lkIjoiOGVjNTc5YWYtNmVmZi00NGI5LWJhNjAtMDJhZDIwOTUwNjk3IiwidG9rZW5fdXNlIjoiYWNjZXNzIiwic2NvcGUiOiJvcGVuaWQgZW1haWwiLCJhdXRoX3RpbWUiOjE2ODM4MDQwNzQsImV4cCI6MTY4MzgwNzY3NCwiaWF0IjoxNjgzODA0MDc0LCJqdGkiOiJkMzhiNTdlNS03OWVkLTQ2YWItYmE2NC0wZWVhMTA5ODhjOWEiLCJ1c2VybmFtZSI6Im1sZXJvbWFpbiJ9.U6m2Z0027BZp0RF-sLvWbZ1bXev3VRz4T76K1-2U0kBKyjsHoZsz_QESZYCyEt9--kW8eha3K9K--5qouAP5sR3DuRmPsRnIAc9uyTFI-hpOJNodJp4r6kCdKe27u9GzjTa4gAF9jxLhUaGpE3TbhMGUVMmoer-WfrN-nOPsVpAOkKJH4yZfLz1bIPU76N4uBXLWu-piqmB_9dMJBvqT0zslriyhtTqirk7-ulwBiNgNSA8o5Qrp5OM6gIwWNAl_aErt4SikqoHWL3eupvfU3wV5Xn7SHRh1N7vrKuRlIenBaGFPgWuXEn32EaxnVqWwnqG2QmMHr-u9bjZizCqguA" -H "Content-Type: application/json" -d "{\"codePorteur\":\"1234\",\"mode\":\"1\"}"
#exit 0

echo "--> Tests $TARGET"

i=""
c=0
while [ "$i" != "0" ]
do 
    banner "($c.1) No Turbo"
    sleep 1
    ./shellfsv.sh -lc >"./out/file_$c"
    cat "./out/file_$c" | jq '.dataResult.data' | sed 's/^.//'| base64 -d
    banner "($c.2) With Turbo"
    sleep 1
    ./shellfsv.sh -lc -turbo >"./out/file_turbo_$c"
    cat "./out/file_turbo_$c" | jq '.dataResult.data' | sed 's/^.//'| base64 -d
    read -p "Next>" i
    ((c=c+1))
done

exit 0