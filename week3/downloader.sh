#!/bin/bash

Green='\033[0;32m'        # Green
White='\033[0;37m'        # White


while :
do
    echo -e "${Green}Enter a URL to download from, or type 'exit':${White}"

    read input

    if ([ "$input" == 'exit' ])
    then
        exit 1

    else
    wget "$input"
    fi
done

exit 0