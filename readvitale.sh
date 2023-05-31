#!/bin/bash
source def.sh

echo "--> Tests $TARGET"

i=""
c=0
while [ "$i" != "0" ]
do 
    date=`date | tr -d ' '`
    banner "($c.1) No Turbo"
    sleep 1
    ./shellfsv.sh -lsv >"./out/file_$date"
    cat "./out/file_$date" | jq '.dataResult.data' | sed 's/^.//'| base64 -d
    banner "($c.2) With Turbo"
    sleep 2
    ./shellfsv.sh -lsv -t >"./out/file_turbo_$date"
    cat "./out/file_turbo_$date" | jq '.dataResult.data' | sed 's/^.//'| base64 -d
    diff -sq ./out/file_$date ./out/file_turbo_$date
    read -p "Next>" i
    ((c=c+1))
done

exit 0