#!/bin/bash
#Description: Print diamond 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

numOfRows=7
numOfStars=1

let halfOfRow=$numOfRows/2+1
let numOfSpaces=$numOfRows/2

for (( i=$numOfRows; i>0; i-=1 ))
do
	for (( j=$numOfSpaces; j>0 ; j-=1 ))
	do
		echo -n " "
	done

	for (( j=$numOfStars; j>0 ; j-=1 ))
	do
		echo -n "*"
	done

	if [ $i -gt $halfOfRow ]
	then		
		let numOfSpaces=$numOfSpaces-1
		let numOfStars=$numOfStars+2
	else
		let numOfSpaces=$numOfSpaces+1
		let numOfStars=$numOfStars-2
	fi 

	echo ""
done

exit 0
