#!/bin/bash
source def.sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ]
    then
        echo "usage: shellfsv [--help] [-h]"
        echo "Invokes Olaqin CloudFSV API"
        echo "Implitly uses defs in def.sh"
fi