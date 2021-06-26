#!/bin/bash
#Brendan Menzies - CYB6004 Scripting Languages Assessment 4


# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

#The website is saved as the variable webpage
webpage=$(curl https://haveibeenpwned.com/PwnedWebsites)

#The following tests look at the website using the way back machine to test a different dataset. Used for testing only.
#Test 1 - only gets company names - page design is too old.
#webpage=$(curl https://web.archive.org/web/20170719042521/https://haveibeenpwned.com/PwnedWebsites)
#Test 2 - works fine
#webpage=$(curl https://web.archive.org/web/20190307045831/https://haveibeenpwned.com/PwnedWebsites)
#Test 3 - works fine
#webpage=$(curl https://web.archive.org/web/20191203203508/https://haveibeenpwned.com/PwnedWebsites)




#This section gets the names of the companies
#Finds all of the text between <h3></h3> tags. 
#Then  removes any lines with html tags and any with leading spaces
#Format of this HTML is:

#<h3>
#   Company Name
#</h3>

companies=$(echo "$webpage" | sed -n "/<h3>/,/<\/h3>/p" | sed '/<*>/d' | sed 's/^ *//' | sed 's/ *$//')




#The next sections all have the same format, unlike above, its all on one line.
#format of the HTML is

#<strong>Breach date:</strong> 22 March 2020<br>

#The first section uses awk and uses the relevant section as a field seperator
#Blank lines are removed using sed '/^$/d'
#Any stray HTML tags are removed using sed 's/<.*>//'
#Then any lines starting with a space are removed using sed 's/^ *//'
breachDates=$(echo "$webpage" | awk -v FS="(Breach date:</strong>|<br>)" '{print $2}' | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')

reportedDates=$(echo "$webpage" | awk -v FS="(Date added to HIBP:</strong>|<br>)" '{print $2}' | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')

comprimisedAccounts=$(echo "$webpage" | awk -v FS="(Compromised accounts:</strong>|<br>)" '{print $2}' | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')

dataType=$(echo "$webpage" | awk -v FS="(Compromised data:</strong>|<br>)" '{print $2}' | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')

#The above variables only stored the value in array index [0] - hard to pull the information out of this.
#The below converts each into an array of the correct length by splitting it with /n separator.



IFS=$'\n' companies2=($companies)
IFS=$'\n' breachDates2=($breachDates)
IFS=$'\n' reportedDates2=($reportedDates)
IFS=$'\n' comprimisedAccounts2=($comprimisedAccounts)
IFS=$'\n' dataType2=($dataType)



#This is the length of the array and the counter for the while loop.
numData=${#companies2[@]}
counter=0

printf "|"
printf "${Cyan}%-55s${White}" "Company:"
printf "|"
printf "${Cyan}%-20s${White}" "Breach Date:"
printf "|"
printf "${Cyan}%-20s${White}" "Reported Date"
printf "|"
printf "${Cyan}%-25s${White}" "Accounts Comprimised:"
printf "|\n"
printf "|-------------------------------------------------------|--------------------|--------------------|-------------------------|\n"

#This while loop prints out each of the variables into a table.
#The script checks if the counter is divisible by two and applies different colouring for alternating lines.
while [ $counter -lt $numData ]
do
    if (($counter % 2 == 0))
    then
        printf "|"
        printf "${Purple}%-55s${White}" " ${companies2[$counter]}"
        printf "|"
        printf "${Purple}%-20s${White}" " ${breachDates2[$counter]}"
        printf "|"
        printf "${Purple}%-20s${White}" " ${reportedDates2[$counter]}"
        printf "|"
        printf "${Purple}%-25s${White}" " ${comprimisedAccounts2[$counter]}"
        printf "|\n"
    else
        printf "|"
        printf "${Blue}%-55s${White}" " ${companies2[$counter]}"
        printf "|"
        printf "${Blue}%-20s${White}" " ${breachDates2[$counter]}"
        printf "|"
        printf "${Blue}%-20s${White}" " ${reportedDates2[$counter]}"
        printf "|"
        printf "${Blue}%-25s${White}" " ${comprimisedAccounts2[$counter]}"
        printf "|\n"
    fi


    ((counter++))
done

printf "|-------------------------------------------------------|--------------------|--------------------|-------------------------|\n"

if [[ ${#companies2[@]} == ${#breachDates2[@]} && ${#companies2[@]} == ${#reportedDates2[@]} && ${#companies2[@]} == ${#comprimisedAccounts2[@]}  ]]
then
    echo "Data columns are equal - Data is alligned correctly."
else
    echo "Data columns are not equal"
    echo "Number of Companies :${#companies2[@]}"
    echo "Number of Breach Dates: ${#breachDates2[@]}"
    echo "Number of Reported Dates: ${#reportedDates2[@]}"
    echo "Number of Reported Dates: ${#comprimisedAccounts2[@]}"
fi

exit 0