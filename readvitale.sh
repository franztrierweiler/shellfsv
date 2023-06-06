#!/bin/bash
source def.sh

echo "--> Tests $TARGET"

i=""
c=0
while [ "$i" != "0" ]
do 
    date=`date | tr -d ' '`

    read -p "Card name>" card_name

    mkdir out/$card_name

    banner "($c.1) No Turbo"
    sleep 1
    ./shellfsv.sh -lsv >"./out/$card_name/file_$date"

    # Display on screen for NON TURBO then write in file
    cat "./out/$card_name/file_$date" | jq '.dataResult.data' | sed 's/^.//'| base64 -d
    cat "./out/$card_name/file_$date" | jq '.dataResult.data' | sed 's/^.//'| base64 -d > ./out/$card_name/file_JSON_$date

    banner "($c.2) With Turbo"
    sleep 2
    ./shellfsv.sh -lsv -t >"./out/$card_name/file_turbo_$date"

    # Display on screen for TURBO then write in file
    cat "./out/$card_name/file_turbo_$date" | jq '.dataResult.data' | sed 's/^.//'| base64 -d
    cat "./out/$card_name/file_turbo_$date" | jq '.dataResult.data' | sed 's/^.//'| base64 -d > ./out/$card_name/file_turbo_JSON_$date

    diff -sq ./out/$card_name/file_$date ./out//$card_name/file_turbo_$date
    read -p "Next>" i
    ((c=c+1))
done

exit 0