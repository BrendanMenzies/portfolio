#!/bin/bash
#curl https://haveibeenpwned.com/PwnedWebsites

#This section gets the names of the companies
#Finds all of the text between <h3></h3> tags. 
#Then  removes any lines with html tags
#Format of this HTML is:

#<h3>
#   Company Name
#</h3>

companies=$(sed -n "/<h3>/,/<\/h3>/p" tmp_file | sed '/<*>/d')


#The next sections all have the same format, unlike above its all on one line.
#format of the HTML is

#<strong>Breach date:</strong> 22 March 2020<br>

#The first section uses awk and uses the relevant section as a field seperator
#Blank lines are removed using sed '/^$/d'
#Any stray HTML tags are removed using sed 's/<.*>//'
#Then any lines starting with a space are removed using sed 's/^ *//'
breachDates=$(awk -v FS="(Breach date:</strong>|<br>)" '{print $2}' tmp_file | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')

reportedDates=$(awk -v FS="(Date added to HIBP:</strong>|<br>)" '{print $2}' tmp_file | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')

comprimisedAccounts=$(awk -v FS="(Compromised accounts:</strong>|<br>)" '{print $2}' tmp_file | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')

dataType=$(awk -v FS="(Compromised data:</strong>|<br>)" '{print $2}' tmp_file | sed '/^$/d' | sed 's/<.*>//' | sed 's/^ *//')



#The above variables only stored the value in array index [0].
#The below converts each into an array of the correct length by splitting it with /n separator.

IFS=$'\n' companies2=($companies)
IFS=$'\n' breachDates2=($breachDates)
IFS=$'\n' reportedDates2=($reportedDates)
IFS=$'\n' comprimisedAccounts2=($comprimisedAccounts)
IFS=$'\n' dataType2=($dataType)

numData=${#companies2[@]}

for i in {0..$numData}
do
    echo "${companies2[$i]} | ${breachDates2[$i]} | ${reportedDates2[$i]} | ${comprimisedAccounts2[$i]} | "
done

#Debugging

echo "Number of companies:"
echo "${#companies2[@]}"

echo "$(({0..$numData}))"

exit 0