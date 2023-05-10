#!/bin/bash
source def.sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ]
    then
        echo "usage: shellfsv [--help] [-h]"
        echo "                [--lireconfig] [-lv]"
        echo "                [--lirecartecps] [-lcps]"
        echo "                [--liredroitsvitale] [-lsv]"
        echo "Invokes Olaqin CloudFSV API"
        echo "Implitly uses defs in def.sh"
fi

if [ "$1" = "--lireconfig" ] || [ "$1" = "-lc" ]
    then
        echo $API_LIRE_CONFIG
        curl -X GET "$API_LIRE_CONFIG?terminalId=$TERMINAL_ID" -H  "accept: application/json; charset=UTF-8" -H  "accessHealthcareToken: $TOKEN"
fi

if [ "$1" = "--lirecarteps" ] || [ "$1" = "-lcps" ]
    then
        echo $API_LIRE_CARTE_PS
fi

if [ "$1" = "--liredroitsvitale" ] || [ "$1" = "-lsv" ]
    then
        echo $API_LIRE_DROITS_VITALE
fi
