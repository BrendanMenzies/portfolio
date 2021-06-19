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
    
      
grep "/bin/bash" /etc/passwd | awk 'BEGIN { 
    

    FS=":"; 
      
    printf "| \033[0;34mUsername\033[0;37m\t       | \033[0;34mUserID\033[0;37m | \033[0;34mGroupID\033[0;37m | \033[0;34mHome\033[0;37m\t\t\t        | \033[0;34mShell\033[0;37m\t\t       |\n"; 
    print "|______________________|________|_________|_____________________________________|______________________|";
} 


#$7 == "/bin/bash" { 
    #We are only interested in printing fields 1,3,4,6, & 7.
 {   
    printf("| \033[33m%-20s\033[0m | \033[35m%-6s\033[0m | \033[35m%-7s\033[0m | \033[35m%-35s\033[0m | \033[35m%-20s\033[0m |\n", $1, $3, $4, $6, $7); 

} 
      
END { 
      
    print("________________________________"); 
      
}' 