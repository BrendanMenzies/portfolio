#! /bin/bash

#Takes in fodler name and password with hidden text
echo "Type folder name: "
read folderName

echo "Type password: "
read -s password

#Makes a folder based on the input folder name, then moves into that folder.
mkdir $folderName
cd $folderName

#Writes the password into the text file named secret.txt
echo $password | sha256sum > ./secret.txt