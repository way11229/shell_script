#!/bin/bash
#Description: generate password 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

numberChars="0123456789"
letterChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

read -p "Please select numbers, letters or both in the password (n:number, l:letter, b:both): " generateOption

if [[ -z $generateOption ]]
then
	echo "option is empty"
	exit 1
fi

read -p "Please input the length of password: " lenOfPassword 


if [[ -z $lenOfPassword || $lenOfPassword == 0 ]]
then
	echo "length is empty"
	exit 1
fi

selectChars=""
case $generateOption in
	"n" )
		selectChars=$numberChars
	;;
	"l" )
		selectChars=$letterChars
	;;
	"b" )
		selectChars="$numberChars$numberChars$numberChars$numberChars$numberChars$letterChars"
	;;
	* )
		echo "option is error"
		exit 1
esac

selectChars=($(echo $selectChars | grep -o .))

password=""
numOfChars=${#selectChars[*]}
for (( i=0; i<$lenOfPassword; i+=1 ))
do
	let charNum=$RANDOM%$numOfChars
	char=${selectChars[$charNum]}
	password="$password$char"
done

echo "Your password: $password"

exit 0

