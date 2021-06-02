#! /bin/bash

#store password as variable
echo "Please enter password: "
read -s password

#read password hash from secret.txt
read storedPassword < ./secret.txt

#hash the entered password
passwordHash=$(echo $password | sha256sum)

#Used for debugging
#echo "PasswordHash was $passwordHash"
#echo "Stored hash was $storedPassword"

#Compare the two hashes
if [[ "$passwordHash" == "$storedPassword" ]]
then
echo "Access Granted"
exit 0
else
echo "Access Denied!"
exit 1
fi 
