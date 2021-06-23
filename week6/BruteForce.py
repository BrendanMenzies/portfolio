#!/usr/bin/python3 
       
import hashlib 
       
#hidden password hash 
       
passwordHash = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824" 


characters = ['','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0']

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
            