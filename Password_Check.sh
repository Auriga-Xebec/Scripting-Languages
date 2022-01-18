#!/bin/bash

##password = hello
read -sp 'Password: ' && echo "$REPLY" | sha256sum > pass_compare.txt

file_1=$(<secret.txt)
file_2=$(<pass_compare.txt)

#echo $file_1
#echo $file_2

if [ "$file_1" = "$file_2" ]; then

    echo "Access Granted"
    rm pass_compare.txt
    #bash Folder_Maker.sh
    exit 0


else
    echo "Access Denied"
    rm pass_compare.txt
    exit 1
fi