#!/bin/bash

echo "Welcome to the Bash Calcualtor"

#variables
#number1=0
#number2=0
#operator=""
#result=0

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

#takes an input for number 1
echo "Enter the first integer:"
read number1

#check if number1 is an integer
re='^[0-9]+$'
if ! [[ $number1 =~ $re ]]
then
   echo "error: Not an integer" >&2; exit 1
fi

#takes and input for the operator
echo -e "Enter the operator (${Blue}+${White}, ${Green}-${White}, ${Red}*${White}, or ${Purple}/${White}):"
read operator

#checks if the operator is valid
if ([ "$operator" != "+" ] && [ "$operator" != "-" ] && [ "$operator" != "*" ] && [ "$operator" != "/" ])
then
    echo "Not a valid operator!"
    exit 1
fi

#takes input for number 2
echo "Enter the second integer:"
read number2

#checks if number 2 is a number
re='^[0-9]+$'
if ! [[ $number2 =~ $re ]]
then
   echo "error: Not an integer" >&2; exit 1
fi

case "$operator" in
"+" )
# code if match
result=$(echo $number1+$number2 | bc)
echo -e "${Blue}$number1 + "$number2" = "$result"${White}"
;;

"-" )
# code if match
result=$(echo $number1-$number2 | bc)
echo -e "${Green}$number1 - "$number2" = "$result"${White}"
;;

"/" )
# code if match
result=$(echo $number1/$number2 | bc)
echo -e "${Purple}$number1 / "$number2" = "$result"${White}"
;;

"*" ) 
# code if match
result=$(echo $number1*$number2 | bc)
echo -e "${Red}$number1 * "$number2" = "$result"${White}"
;;
esac


#Debugging
#echo "Entered values were $number1, $operator, $number2"


exit 0