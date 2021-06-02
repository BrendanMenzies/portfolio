#! /bin/bash

#run the below script
./passwordCheck.sh

#check if the exit code of the script = 0 - i.e. a success
if [ $? -eq 0 ]
then
echo "1. Create a folder"
echo "2. Copy a folder"
echo "3. Set a password"

read choice

case $choice in

    1)
    ./foldermaker.sh
    ;;

    2)
    ./folderCopier.sh
    ;;

    3)
    ./setPassword2.sh 
    ;;

    *)
    echo "Not valid"
esac

else
exit 1
fi 
