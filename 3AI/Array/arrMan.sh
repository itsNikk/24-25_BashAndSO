#!/bin/bash

totalSum() {
	sum=0
	# e prende direttamente i valori dall'array. Si può fare anche con il classico ciclo for
	for e in ${arr[@]}
	do
		((sum+=e))
	done
	echo $sum
}

avgVal() {
	total=$(totalSum)
	echo $(($total/$arrLength))
}

findElement() {
	read -p "Inserisci elemento da cercare: " elem
	#TODO: cosa succede se, per sbaglio, premo invio senza aver inserito un valore?
	for e in ${arr[@]}
	do
		if [ $e -eq $elem ]
		then
			echo "Trovato: $e"
			#Perchè return e non break?
			return
		fi
	done
	echo "Non trovato"
}

findMinMax(){
	min=${arr[0]}
	max=${arr[0]}
	for e in ${arr[@]}
	do
		if [ $e -lt $min ]
		then
			min=$e
		fi

		if [ $e -gt $max ]
		then
			max=$e
		fi
	done
	echo "$min $max"
}

extractEvenArray() {
	evenArr=()
	for e in ${arr[@]}
	do
		if [ $(($e % 2)) -eq 0 ]
		then
			evenArr[${#evenArr[@]}]=$e
			#Come faccio ad aggiungere un valore ad evenArr?
		fi
	done
	echo ${evenArr[@]}
}


swapArrayElems() {
	read -p "Inserisci primo indice per lo scambio: " index1
	read -p "Inserisci secondo indice per lo scambio: " index2

	#Scambio solo se indici validi!
	if [[ (index1 -ge 0 && index1 -lt ${#arr[@]}) && (index2 -ge 0 && index2 -lt ${#arr[@]}) ]]
	then
		temp=${arr[$index1]}
		arr[$index1]=${arr[$index2]}
		arr[$index2]=$temp
	else
		echo "Indici per lo scambio non validi!"
	fi
}


#Main, is that you?
if [ $# -ne 1 ] || [ $1 -le 0 ]
then
	echo "Bisogna inserire esattamente un paramentro e deve essere maggiore di 0."
	exit 1
fi

arrLength=$1
arr=()

for e in $(seq 0 $((arrLength-1)))
do
	arr[$e]=$(($RANDOM % (100-4) +4))
done

echo "Array iniziale: ${arr[@]}"


totalSum=$(totalSum)
echo "La somma totale degli elementi è: $totalSum"
echo "La media è: $(avgVal)"
echo "$(findElement)"
echo "Il minimo e il massimo valore dell'array sono: $(findMinMax)"
echo "Array numeri pari: $(extractEvenArray)"
swapArrayElems
echo ${arr[@]}
