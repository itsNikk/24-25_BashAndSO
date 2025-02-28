#!/bin/bash

#1) CHIEDI 2 num da riga di comando = $1....$9
# NO read!!

if [ $# -ne 2 ]
then
	echo "erroe."
	exit 1
fi

# -p = prompt (il messaggio di input)
num1=$1
num2=$2

# espansione aritmetica
sum=$((num1+num2))

echo "$num1 + $num2 = $sum"

if [ $sum -gt 10 ] && [ $sum -lt 20 ]
then
	echo"dsfsd"
fi

