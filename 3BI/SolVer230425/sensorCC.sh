#!/bin/bash


values=()
max=0
avg=0

showMenu(){
  	echo "=== Centro di Controllo Sensori ==="
  	echo "1) Inserire un valore da un sensore"
  	echo "2) Mostrare tutti i valori inseriti"
  	echo "3) Uscire"
 	echo "4) Calcolo e visualizzazione valori fuori soglia (>80)"
  	echo "==================================="
}

addValue() {
	if [ $# -gt 0 ] && [ $1 == "r" ]
	then
		v=$(($RANDOM % (10000-20) +20))
	else
		read -p "Inserisci nuovo valore: " v
	fi
	#Inserisco v nella posizione pari alla lunghezza del vettore
	values[${#values[@]}]=$v
	echo "Valore inserito"

}

showValues() {
	sum=0
	if [ $# -eq 0 ] || [ $1 -eq 0 ]
	then

		for elem in ${values[@]}
		do
			echo -n "$elem "
			((sum+=$elem))
			if [ $elem -gt $max ]
			then
				max=$elem
			fi
		done
		# solo per andare a capo
		echo
		avg=$((sum/${#values[@]}))
		echo "Massimo: $max"
		echo "Media: $avg"
		echo
	elif [ $1 -gt 0 ]
	then
		#Ho usato lo slicing ma si poteva fare con un semplice for
		echo ${values[@]:0:$1}
	else
		echo "Il parametro non è valido ($1)"
	fi
}

computeAnomalies() {
	anomali=()
  	for val in "${values[@]}"
  	do
    		if [ $val -gt 80 ] 
    		then
      			anomali[${#anomali[@]}]=$val
    		fi
  	done
  	echo "${anomali[@]}"
}

saveToFile() {
	location=$HOME/Desktop
	cd $location
	fileName=".sensorReport.txt"

	echo ${values[@]} > $fileName
	echo "Massimo: $max" >> $fileName
	echo "Media: $avg" >> $fileName

	read -p "Dammi il numero da cercare nel file: " n
	grep -o $n $fileName
}

while true
do
showMenu
read -p "Scelta: " userChoice

case $userChoice in
1)
read -p "Random value? (y/n) " randomChoice
if [ $randomChoice == "y" ]
then
	addValue r
else
	addValue
fi
;;
2) showValues ;;
3)
# Qui solo per evitare di modificare il menu. E' stata una scelta estemporanea, non era esplicitamente richiesto quindi è fonte di interpretazione.
saveToFile
echo "Closing.."
exit 0
;;
4)
echo "Valori anomali (>80)"
echo $(computeAnomalies)
;;
*)
echo "Scelta non riconosciuta ($userChoice)"
;;
esac
done
