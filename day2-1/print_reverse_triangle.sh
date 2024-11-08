#!/bin/bash
#Description: Print reverse triangle 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

numOfRows=8

for (( numOfSpaces=$numOfRows-1; numOfSpaces>=0; numOfSpaces-=1 ))
do
	numOfStars=$numOfRows-numOfSpaces

	for (( i=$numOfSpaces ; i>0 ; i-=1 ))
	do
		echo -n " "
	done

	for (( i=$numOfStars ; i>0 ; i-=1 ))
	do
		echo -n "*"
	done

	echo ""	
done

exit 0
