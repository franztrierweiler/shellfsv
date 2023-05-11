#!/bin/bash
source def.sh

echo "--> Tests $TARGET"

i=""
c=0
while [ "$i" != "0" ]
do 
    echo "$c"
    echo "$i"
    ./shellfsv.sh -lc >"file_$c"
    ./shellfsv.sh -lc -turbo >"file_turbo_$c"
    read -p "Next>" i
    ((c=c+1))
done
exit 0