#!/bin/bash

# prendi un input da riga di comando R
l=$1
# riempi un array lungo R di numeri casuali
arr=()
for elem in $(seq 0 $l)
do
	arr[$elem]=$RANDOM
done

# stampa array SU UNA RIGA
for elem in ${arr[@]}
do
	echo -n "$elem "
done
#EST1) fai inserire min e max dall'utente
