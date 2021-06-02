#!/bin/bash

#takes file input from cli
input=$1

#starts a while loop to iteate through each line
while IFS= read -r line

do
    #Do nothing if the line is blank
    if ([ "$line" == "" ])
    then

    continue

    #checks if the line is a file
    elif test -f $line
    then

        echo "$line - That file exists!"
        
    #checks if the line is a directory
    elif test -d $line
    then

        echo "$line - This is a directory!"

    #don't know what this is
    else

        echo "$line - I don't know what this is!"

    fi

done < "$input"

exit 0