#!/bin/bash

nb_files=`ls out/ | wc -l`
file_list=`ls out/`

i=0
for file in $file_list
do
    if [ `echo "$file" | wc -c` = 30 ]
    then
        # Fucking gnu sed !
        target=`echo "$file" | sed 's/file_/&turbo_/'`
        echo "File = $file"q
        echo "Target = $target"
        diff -q "out/$file" "out/$target" >> result_not_identical_files

        cat "out/$file" | grep "{\"codeResult\":0,\"dataResult\"" >> result_no_error
        cat "out/$target" | grep "{\"codeResult\":0,\"dataResult\"" >> result_no_error_turbo

        error=`cat "out/$file" | jq '.codeResult'`
        echo "error=$error"
        if (( error != 0 ))
        then
            banner 1
            cat "out/$file" >> result_error
        fi

        error=`cat "out/$target" | jq '.codeResult'`
        echo "error=$error"
        if (( $error != 0 ))
        then
            banner 2
            cat "out/$target" >> result_error_turbo
        fi
        ((i=i+1))
    fi
done
echo "$i fichiers analysés"
echo "`cat result_not_identical_files | wc -l` non identiques"