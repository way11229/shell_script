#!/bin/bash
#Description: check ip format and show domain 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

convertToBinary () {
	echo "obase=2; $1" | bc
}

validateIp() {
	if [[ -z $1 ]]
	then
		return 1
	fi

	local IFS='.'
	local -a splitedIP=($1)

	for e in "${ip[@]}"
	do
		[[ $e =~ ^[0-9]+$ ]] || return 1
		(( e >= 0 && e <= 255 )) || return 1
	done

	return 0
}

getDecimalDomainParts() {
	local IFS='.'
	local -a splitedIP=($1)
	local -a splitedSubnetMask=($2)

	if [[ ${#splitedIP[@]} != 4 ]] ||  [[ ${#splitedSubnetMask[@]} != 4 ]]
	then
		return 1
	fi

	local decimalDomainParts=0
	for (( i=0; i<${#splitedIP[@]}; i+=1 ))
	do
		local convertIpPartRtn=$(convertToBinary ${splitedIP[$i]})
		local binaryIpPart=`echo $convertIpPartRtn | numfmt --format=%08f`

		local convertSubnetMaskPartRtn=$(convertToBinary ${splitedSubnetMask[$i]})
		local binarySubnetMaskPart=`echo $convertSubnetMaskPartRtn | numfmt --format=%08f`

		let decimalDomainParts[$i]=$((2#$binaryIpPart & 2#$binarySubnetMaskPart))
	done

	echo ${decimalDomainParts[@]}

	return 0
}

getIpDomain() {
	if [[ -z $1 ]] || [[ -z $2 ]]
	then
		return 1
	fi

	local decimalDomainParts=$(getDecimalDomainParts $1 $2)	

	statusOfGetDecimalDomainParts=$?	
	if [[ $statusOfGetDecimalDomainParts -ne 0 ]]
	then
		return 1
	fi

	echo "${decimalDomainParts// /.}"

	return 0
}

if [[ -z $2 ]]
then
	echo "Please input IP address and subnet mask. [EXAMPLE] $0 8.8.8.8 255.255.255.0"
	exit 1
fi

if ! validateIp $1
then
	echo "IP is invalid"
	exit 1
fi

if ! validateIp $2
then
	echo "Subnet mask is invalid"
	exit 1
fi

ipDomain=$(getIpDomain $1 $2)

statusOfGetIpDomain=$?
if [[ $statusOfConvertBinaryDomainPartsToDecimalDomainParts -ne 0 ]]
then
	echo "get IP domain error"
	exit 1
fi

echo "The IP domain is $ipDomain" 

exit 0

