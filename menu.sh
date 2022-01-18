#!/bin/bash


##password = hello

read -sp 'Password: ' && echo "$REPLY" | sha256sum > pass_compare.txt 

file_1=$(<secret.txt)
file_2=$(<pass_compare.txt)


if [ "$file_1" = "$file_2" ]; then

    echo "Access Granted"
    rm pass_compare.txt
    
    read -p "1 = Folder Maker, 2 = Folder Copy 3 = Change password " selection

    case $selection in

        1)
            bash Folder_Maker.sh
        ;;

        2)
            bash Folder_copy.sh
        ;;

        3)
            echo "Please enter new password"
            read -sp 'Password: ' && echo "$REPLY" | sha256sum > interim.txt
            echo "Please re-enter password"
            read -sp 'Password: ' && echo "$REPLY" | sha256sum > interim_2.txt

            interim_1=$(<interim.txt)
            interim_2=$(<interim_2.txt)
            
            if [ "$interim_1" = "$interim_2" ]; then

            echo "$interim_1" > secret.txt
            rm interim.txt 
            rm interim_2.txt
            echo "Password changed"
            else
            rm interim.txt 
            rm interim_2.txt
            echo "The retyped password does not match"

            fi

        ;;

        *)
            echo "Selected something other than 1 - 3"

    esac

    exit 0


else
    echo "Access Denied"
    rm pass_compare.txt
    exit 1
fi


