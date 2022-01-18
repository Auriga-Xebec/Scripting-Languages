
#!/bin/bash 
      
echo "enter the password" 
      
read password 
      
len="${#password}"
      
if test $len -ge 8 ; then 
      
    echo "$password" | grep  [0-9] 
      
    if test $? -eq 0 ; then 
      
    echo "$password" | grep  [A-Z] 
      
    if test $? -eq 0 ; then 
      
    echo "$password" | grep  [a-z] 
      
    if test $? -eq 0 ; then 
      
    echo "$password" | grep  [$,@,#,%] 
      
    if test $? -eq 0 ; then 
      
    echo "Strong password" 
      
        else 
      
        echo "weak password include special chars" 
      
        fi 
      
    else 
      
    echo "weak password include lower case char" 
      
    fi 
      
    else 
      
    echo "weak password include capital char" 
      
    fi 
      
    else 
      
    echo "please include the numbers in password it is weak password" 
      
    fi 
      
else 
      
echo "password length should be greater than or equal 8 hence weak password" 
      
fi 
     