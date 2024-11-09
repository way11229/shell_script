#!/bin/bash
#Description: calculate m2 to ping.
#Write by Way
#Version: v1.0.0

[ -z $1 ] && echo "Please input area value" && exit 1

echo "$1m2 is `expr $1 \* 3025 / 10000`坪"

exit 0
