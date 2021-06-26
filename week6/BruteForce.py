#!/usr/bin/python3 
       
import hashlib 
       
#hidden password hash 
       
passwordHash = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824" 

#This is the list of characters that will be looped thtough
#Left out special characters and upper case so it doesnt take as long.
characters = ['','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0']


#This loops through each element in the character array in 8 different loops
#this creates words of up to 8 characters - obviously not the most ideal solution
#I have commented out printing each hash as this really slows it down
#I have also added a calculating message every 4th character change
#This is to give the user some feedback that its doing something.
for a in characters:
    for b in characters:
        for c in characters:
            for d in characters:
                for e in characters:
                    for f in characters:
                        for g in characters:
                            for h in characters:
                                word=a+b+c+d+e+f+g+h
                                wordHash=hashlib.sha256(word.encode("utf-8")).hexdigest()
                                #print("Trying: "+word+" : " +wordHash)
                                
                                if wordHash == passwordHash:
                                    print("The password is: "+word)
                                    exit()
                print("Calculating...")       
            