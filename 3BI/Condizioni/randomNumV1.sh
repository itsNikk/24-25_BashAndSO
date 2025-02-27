#!/bin/bash
#stdin=read

min=$1
max=$2
#1) gen random num
rndNum=$(( ($RANDOM%$max)+$min ))

echo $rndNum
if [ $(( $rndNum % 2 )) -eq 0 ]
then
	echo "Il numero $rndNum è pari"
else
	echo "Il numero $rndNum è dispari"
fi
