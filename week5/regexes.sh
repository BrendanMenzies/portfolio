#!/bin/bash

#all lines containing 'sed'
grep -rw 'sed ' ~/scripts/portfolio/

#all lines starting with 'm'
grep -r "^m" ~/scripts/portfolio/

#all lines contaiing 3 digit numbers.
grep -r ' [0-9][0-9][0-9] ' ~/scripts/portfolio/

#all echo statements with at least three words
#this includes 'echo'and 'echo -*'
grep -Er 'echo "*(\w+\b.){4}*"|echo -[a-zA-Z] "*(\w+\b.){5}*"' ~/scripts/portfolio/

#all lines that would make a good password
#I have made this a series of piped expressions looking for:
#at least 13 characters, lowercase, uppercase, numbers and special characters
grep -Er '(.){13}' ~/scripts/portfolio/ | grep -E '([a-z])' | grep -E '([A-Z])' | grep -E '([0-9])' | grep -E '[[:punct:]]'
