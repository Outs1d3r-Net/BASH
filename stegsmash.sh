#!/bin/bash

#The brute force for steghide By:Init-0

if [ "$1" == "" ]
then
	echo -e "\033[1;32m#######################################################\033[0m"
        echo -e "\033[1;32m## Usage: $0\033[0m" "\033[1;31mWORDLIST_PATH\033[0m" "\033[1;33mFILE_STEGHIDE\033[0m""\033[1;32m ##\033[0m"
	echo -e "\033[1;32m#######################################################\033[0m"
	exit 0
fi
zcat -f $1 | while read pass
do
result=$(steghide extract -sf $2 -p "$pass" 2>&1 | grep "wrote" | wc -l)
	if [ $result == 1 ];then
			echo "The file password is: $pass"
			exit 0
	fi
done
