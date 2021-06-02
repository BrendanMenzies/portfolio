#!/bin/bash

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White


#run the below script for password entry
echo "p.s. the password is 'hello'"
~/scripts/portfolio/week2/passwordCheck.sh

#check if the exit code of the script = 0 - i.e. a password success
if [ $? -eq 0 ]
then

    #A bit of extra flare
    echo -e "${Yellow}"
    echo "Welcome !" | figlet
    echo -e "${White}"

    while :
    do
        #Menu screen for the users
        echo ""
        echo ""
        echo "MENU SELECTION"
        echo -e "${Cyan}1. Create a folder"
        echo "2. Copy a folder"
        echo "3. Set a password"
        echo "4. Calculator"
        echo "5. Create Week Folders"
        echo "6. Check Filenames"
        echo "7. Download a File"
        echo -e "8. Exit${White}"

        #Takes user input to variale called 'choice'
        read choice

        #most of these cases just point to earlier scripts.
        case $choice in

            1)
            ~/scripts/portfolio/week2/foldermaker.sh
            ;;

            2)
            ~/scripts/portfolio/week2/folderCopier.sh
            ;;

            3)
            ~/scripts/portfolio/week2/setPassword2.sh 
            ;;

            4)
            ~/scripts/portfolio/week3/bashCalculator.sh
            ;;

            5)
            ~/scripts/portfolio/week3/megafoldermaker.sh
            ;;

            6)
            ~/scripts/portfolio/week3/filenames.sh
            ;;

            7)
            ~/scripts/portfolio/week3/downloader.sh
            ;;

            #exit case
            8)
            echo -e "${Purple}"
            echo "Goodbye !" | figlet
            echo -e "${White}"

            exit 1
            ;;

            #case in the event someone types exit
            exit)
            echo -e "${Purple}"
            echo "Goodbye !" | figlet
            echo -e "${White}"

            exit 1
            ;;

            #catch-all case
            *)
            echo "Not a valid selection"
        esac

done

#exit if inital password is incorrect
else
exit 0

fi 
