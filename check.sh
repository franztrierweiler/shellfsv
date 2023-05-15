#!/bin/bash

nb_files=`ls out/ | wc -l`
file_list=`ls out/`

for file in $file_list
do
    if [ "`echo "$file" | wc -c`" = 36 ]
        then
            #echo "$file"
            target=`echo "$file" | sed 's/<file_>/& turbo_/'`
            #echo "Target = $target"
            diff -q "out/$file" "out/$target" >> result_not_identical_files
            diff -s "out/$file" "out/$target" >> result_identical_files
    fi
done