#!/bin/bash
#Description: convert decimal to binary 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

isNumberReg='^[0-9]+$'

validateInt () {
	if ! [[ $1 =~ $isNumberReg ]]
	then
		echo "Please input integer" && exit 1
	fi
}

convertToBinary () {
	echo "obase=2; $1" | bc
}

read -p "Please input a decimal integer: " input

validateInt $input

convertToBinary $input

exit 0
