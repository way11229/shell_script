#!/bin/bash
#Description: inputing number of subjects and calculation score program.
#Write by Way
#Version: v1.0.0

totalScore=0

read -p "Number of subjects: " numOfSubjects 

for (( i=0 ; i<$numOfSubjects; i+=1 ))
do
	read -p "Subject `expr $i + 1` Score: " score
	let totalScore+=${score}
done

echo "Total score: $totalScore"
echo "Average score: `expr $totalScore / $numOfSubjects`"

exit
