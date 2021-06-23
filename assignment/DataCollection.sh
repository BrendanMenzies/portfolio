#!/bin/bash
#curl https://haveibeenpwned.com/PwnedWebsites

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

webpage=$(cat tmp_file)

#The website is saved as the variable webpage
#webpage=$(curl https://haveibeenpwned.com/PwnedWebsites)



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
printf "${Blue}%-55s${White}" "Company:"
printf "|"
printf "${Blue}%-20s${White}" "Breach Date:"
printf "|"
printf "${Blue}%-20s${White}" "Reported Date"
printf "|"
printf "${Blue}%-25s${White}" "Accounts Comprimised:"
printf "|\n"

#This while loop prints out each of the variables into a table.
while [ $counter -lt $numData ]
do
    printf "|"
    printf "%-55s" "${companies2[$counter]}"
    printf "|"
    printf "%-20s" "${breachDates2[$counter]}"
    printf "|"
    printf "%-20s" "${reportedDates2[$counter]}"
    printf "|"
    printf "%-25s" "${comprimisedAccounts2[$counter]}"
    printf "|\n"
    ((counter++))
done

#Debugging

echo "$companies" > companies.txt
echo "${companies2[@]}\n" > companies2.txt

printf "|"
printf "${Blue}%-55s\n${White}" "${companies2[396]}"

exit 0