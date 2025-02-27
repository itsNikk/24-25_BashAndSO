#!/bin/bash
#stdin=read


if [ $# -ne 2 ]
then
	echo "Errore. Inserisci esattamente due parametri. (<min> <max>)"
	exit 1
fi

min=$1
max=$2

if [ $max -lt $min ]
then
	echo "Il massimo deve essere maggiore del minimo. (max:$max min:$min)"
	exit 1
fi

#1) gen random num
rndNum=$(( $RANDOM % ($max-$min+1)+$min ))

echo $rndNum
if [ $(( $rndNum % 2 )) -eq 0 ]
then
	echo "Il numero $rndNum è pari"
else
	echo "Il numero $rndNum è dispari"
fi
