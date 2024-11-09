#!/bin/bash
#Description: input area and unit then output another unit value.
#Write by Way
#Version: v1.0.0

[ -z $2 ] && echo "[EXAMPLE] $0 100(area) -m(-m: m^2, -p: 坪)" && exit 1

case $2 in
	-m )
		./m2ToPing.sh $1
		;; 
	-p )
		./pingToM2.sh $1
		;;
	* )
		echo "Parameter error, please input -m, -p" && exit 1
		;;
esac

exit 0
