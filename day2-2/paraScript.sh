#!/bin/bash
#Description: Use  paraments  to  design  an  adder  program.
#Write by Way
#Version: v1.0.0

[ -z $2 ] && echo "[EXAMPLE] $0 100 10" && exit 1

reg='^[0-9]+$'

if ! [[ $1 =~ $reg && $2 =~ $reg ]]
then
	echo "Please input integer" && exit 1
fi

echo "$1 + $2 = $(($1 + $2))"

exit 0
