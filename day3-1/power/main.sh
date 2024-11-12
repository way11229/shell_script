#!/bin/bash
#Description: exponentiation 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

read -p "Please input the base: " base
if [[ -z $base || $base =~ ^[^0-9]+$ ]]
then
	echo "base input error" 
	exit 1
fi

read -p "Please input the exponent: " exponent
if [[ -z $exponent || $exponent =~ ^[^0-9]+$ ]]
then
	echo "exponent input error" 
	exit 1
fi

result=$(./exponentiation.sh $base $exponent)

statusOfExponentiation=$?	
if [[ $statusOfExponentiation -ne 0 ]]
then
	echo "calculation error" 
	exit 1
fi


echo "[DONE]: $base^$exponent is $result"

exit 0

