#!/bin/bash

printError()        
{ 
       
    echo -e "\033[31mERROR:\033[0m $1" 
       
} 


getNumber()   
{ 
      
    read -p "$1: " 
      
    while (( $REPLY < $2 || $REPLY> $3 )); do 
      
        printError "Input must be between $2 and $3" 
      
        read -p "$1: " 
      
    done 
    
    return $REPLY
} 

getNumber "Guess the number between 1 and 100" 1 100

while (($REPLY != 42))
do

    echo "Number was $REPLY"

    if [ $REPLY -lt 42 ]
    then   
        echo "Too low!"

    else
        echo "Too High!"
    fi

getNumber "Try again" 1 100

done

echo "Correct!"

exit 0