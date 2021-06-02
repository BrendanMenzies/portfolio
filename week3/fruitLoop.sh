#!/bin/bash

#Array of fruits
fruits=("Apple" "Mango" "Strawberry" "Orange" "Banana")

#Finds the length of the fruit array
fruitLen=${#fruits[@]}

#Loops through printing each array entry on a separate line
for ((i=0; i<$fruitLen; i++))
do

    echo "FRUIT: ${fruits[$i]}"

done


exit 0