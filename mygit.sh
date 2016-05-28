#!/bin/bash

    IFS=$'\n'
    echo "numargok=[$#]"
    array=($(git branch)) 
    leftBrack="["
    rightBrack="]"
    if [ $# -eq 0 ]; then 
        for i in "${!array[@]}"; do
            echo $leftBrack"$i$rightBrack"="$(echo -e "${array[$i]}" | sed -e 's/^[[:space:]]*//')"$rightBrack
        done
    elif [ $# -gt 0 ]; then

        if [ $1 -lt ${#array[@]} ]; then 
            echo "branch=["${array[$1]}"]"
            git checkout  "$(echo -e "${array[$1]}" | sed -e 's/^[[:space:]]*//')"
        else 
            echo "invalid branch [$1]"
        fi 

        echo "len="${#array[@]}

        if [ $# -eq 1 ]; then 
            echo "arg $1" 
        elif [ $# -eq 2 ]; then 
            echo "arg $2"
        fi
    fi
    

    

