#!/bin/bash
#Description: server healthy check by ping command 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

validateIp() {
	if [[ -z $1 ]]
	then
		return 1
	fi

	local IFS='.'
	local ip=$1

	for e in ${ip[@]}
	do
		[[ $e =~ ^[0-9]+$ ]] || return 1
		(( e >= 0 && e <= 255 )) || return 1
	done

	return 0
}

if [[ -z $1 ]]
then
	echo "Please input ip list file path"
	exit 1
fi

while read ip 
do
	if ! validateIp $ip
	then
		echo "$ip is invalid"
		exit 1
	fi
done < $1

while [ 1=1 ]
do
	while read ip
	do
		rsp=$(ping -c 1 -i 0.2 -W 1 $ip)
		if [[ $? != 0 ]]
		then
			echo -e "$ip is down\a"		
			echo "[`date "+%Y-%m-%d %H:%M:%S"`] $ip is down, error: $rsp" >> ./healthyCheck.log	
		fi
	done < $1

	sleep 10
done

exit 0

