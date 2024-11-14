#!/bin/bash
#Description: lottery game 
#Write by Way(way11229@gmail.com)
#Version: v1.0.0

checkValueInArray() {
	local val=$1
	shift
	local arr=($@)

	if printf '%s\n' "${arr[@]}" | grep -q -w "$val"
	then
		return 0
	fi 

	return 1
}

read -p "How many sets of lottery numbers would you like to buy: " numOfSets

if [[ -z $numOfSets || $numOfSets =~ ^[^0-9]+$ || $numOfSets<=0 || $numOfSets>5 ]]
then
	echo "number of sets is error"
	exit 1
fi

lotterySets=""
for (( i=0; i<$numOfSets; i+=1 ))
do
	read -p "Please input set$(( $i + 1 )), foramt is 1,2,3,4,5,6: " nums 

	IFS="," read -r -a nums <<< $nums 

	if [[ ${#nums[@]} -ne 6 ]]
	then
		echo "Please input 6 numbers"
		let i-=1
		continue
	fi

	uniqueCount=$(printf "%s\n" "${nums[@]}" | sort | uniq | wc -l)
	if [[ $uniqueCount -ne 6 ]]
	then
		echo "Contains duplicated values"
		let i-=1
		continue
	fi
	
	numValidate=1
	for num in ${nums[@]}
	do
		if [[ $num =~ ^[^0-9]+$ || $num -eq 0 || $num -gt 49 ]]
		then
			echo "The number must be between 1 to 49"
			numValidate=0
			break
		fi	
	done

	if [[ $numValidate -eq 0 ]]
	then
		let i-=1
		continue
	fi

	tmpStr=$(printf ",%s" "${nums[@]}")
	lotterySets[$i]=${tmpStr:1}
done

rewardNumbers=""
for (( i=0; i<6; i+=1 ))
do
	let num=$RANDOM%49+1
	if checkValueInArray $num ${rewardNumbers[@]}
	then
		let i-=1
		continue
	fi

	let rewardNumbers[$i]=$num
done

echo "Reward numbers are ${rewardNumbers[@]}"

getReward=0
for lotterySet in ${lotterySets[@]}
do
	IFS="," read -r -a lotterySetArr <<< $lotterySet 

	mached=1
	for numInSet in ${lotterySetArr[@]}
	do
		if ! checkValueInArray $numInSet ${rewardNumbers[@]}
		then
			mached=0
			break
		fi
	done
	
	if [[ $mached -eq 0 ]]
	then
		continue
	fi
	
	getReward=1
	break
done

if [[ $getReward -eq 1 ]]
then
	echo "You Win!!"
else
	echo "No luck this time..."
fi 

exit 0

