#!/bin/bash
source def.sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ]
    then
        echo "usage: shellfsv [--help] [-h]"
        echo "                [--lireconfig] [-lv]"
        echo "                [--lirecartecps] [-lcps]"
        echo "                [--liredroitsvitale] [-lsv]"
        echo "                [--turbo] [-t]"
        echo "Invokes Olaqin CloudFSV API"
        echo "Implitly uses defs in def.sh"
        exit 0
fi

if [ "$1" = "--lireconfig" ] || [ "$1" = "-lc" ]
    then
        TYPE_REQ=GET
        DATA=""
fi

if [ "$1" = "--lirecarteps" ] || [ "$1" = "-lcps" ]
    then
        TYPE_REQ=POST

        if [ "$2" = "--turbo" ] || [ "$2" = "-t" ]
            then
                DATA="{\"codePorteur\":\"1234\",\"mode\":\"1\"}"
            else
                DATA="{\"codePorteur\":\"1234\"}"
        fi
fi

if [ "$1" = "--liredroitsvitale" ] || [ "$1" = "-lsv" ]
    then
        TYPE_REQ=POST

        if [ "$2" = "--turbo" ] || [ "$2" = "-t" ]
            then
                DATA="{\"codePorteur\":\"1234\",\"mode\":\"1\",\"dateConsultation\":\"2023-05-11\",\"labelCvVirtuelle\": \"0102.IN\"}"
            else
                DATA="{\"codePorteur\":\"1234\"}"
        fi
fi

curl -v -X $TYPE_REQ "$API_LIRE_CONFIG?terminalId=$TERMINAL_ID" -H  "accept: application/json; charset=UTF-8" -H  "accessHealthcareToken: $HEALTHCARE_TOKEN" -H "Authorization: Bearer $BEARER_TOKEN" -d "$DATA"

echo "\n"
exit 0