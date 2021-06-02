#! /bin/bash

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White


#store password as variable
echo -e "${Red}Please enter password:${White} "
read -s password

#read password hash from secret.txt
read storedPassword < ~/scripts/portfolio/week2/secret.txt

#hash the entered password
passwordHash=$(echo $password | sha256sum)

#Used for debugging
#echo "PasswordHash was $passwordHash"
#echo "Stored hash was $storedPassword"

#Compare the two hashes
if [[ "$passwordHash" == "$storedPassword" ]]
then
echo -e "${Green}Access Granted${White}"
exit 0
else
echo -e "${Red}Access Denied!${White}"
exit 1
fi 
