#!/bin/bash
#Description: exponentiation 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

if [[ -z $2 ]]
then
	exit 1
fi

echo $(($1**$2))

exit 0
