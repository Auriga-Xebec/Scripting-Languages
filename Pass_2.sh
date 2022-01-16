#!/bin/bash


## Query the user for a directory name
read -p 'Please enter a folder name: ' folder_name 

## Determine if that directory exists
if [ -x "$folder_name" ] ; then ## what the hell is the diffrence between -x and -d

## If that directory exits within the current working directory, navigate to it.
    cd "$folder_name" || exit 0 

## Prompt the user for a password, pipe to a hash function, direct the output to a file
    read -sp 'Password: ' && echo "$REPLY" | sha256sum > secret.txt

else 
    mkdir "$folder_name" && cd "$folder_name" || exit 0
    read -sp 'Password: ' && echo "$REPLY" | sha256sum > secret.txt
fi