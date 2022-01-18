#!/bin/bash

read -p "Please enter a file name to copy: " folder_name

if [ -d "$folder_name" ]; then
    read -p "Destination folder: " destination_folder
    cp -r "$folder_name" "$destination_folder"
else
    echo "Folder does not exist"

fi    