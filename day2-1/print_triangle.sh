#!/bin/bash
#Description: Print triangle 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

numOfRows=8

for (( numOfStars=$numOfRows; numOfStars>0; numOfStars-=1 ))
do
	for (( i=$numOfStars ; i>0 ; i-=1 ))
	do
		echo -n "*"
	done

	echo ""	
done

exit 0
