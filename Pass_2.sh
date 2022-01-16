#!/bin/bash


## List the folders available to the user from the current wd
#ls
## Prompt for a folder name, cd into that folder, if it does not exist, make it and cd into it.
#read -p 'Please enter a folder name: ' folder_name &&  cd "$folder_name" || mkdir "$folder_name" && cd "$folder_name" ## now why does it fail to find existing files if the fail condition is set?
## Prompt the user for a password, if successful, pass the default variable to echo and forward the output to a txt doc.
#
#exit 0

read -p 'Please enter a folder name: ' folder_name 


if [ -x "$folder_name" ] ; then ## what the hell is the diffrence between -x and -d
    cd $folder_name
    read -sp 'Password: ' && echo "$REPLY" | sha256sum > secret.txt

else 
    mkdir $folder_name && cd $folder_name
    read -sp 'Password: ' && echo "$REPLY" | sha256sum > secret.txt
fi