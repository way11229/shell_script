#!/bin/bash
#Description: calculate ping to m2.
#Write by Way
#Version: v1.0.0

[ -z $1 ] && echo "Please input area value" && exit 1

echo "$1坪 is `expr $1  \* 10000 / 3025`m2"

exit 0
