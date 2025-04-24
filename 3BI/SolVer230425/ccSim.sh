#!/bin/bash

saldo=0
storico=()

mostra_menu() {
    echo "=== Menu Conto Corrente ==="
    echo "1) Versamento"
    echo "2) Prelievo"
    echo "3) Visualizza saldo"
    echo "4) Esci"
    echo "5) Storico transazioni"
}

versa() {
	# Controllo subito la condizione che invalida la funzione e
	# interrompo SOLO l'esecuzione di tale funzione con return, non exit.
	if [ $# -gt 1 ]
	then
		echo "Non è ammesso più di un parametro"
		return 0
	fi

	if [ $# -eq 0 ]
	then
		read -p "Inserire valore da versare: " v
		if [ $v -gt 0 ]
		then
			#equivalente a saldo=$((saldo+v))
			((saldo+=v))
			storico[${#storico[@]}]="+$v"
			echo "Saldo aggiornato"
		else
			echo "Valore non corretto per un prelievo ($v)"
		fi
	elif [ $1 == "r" ]
	then
		#NOTA: gli spazi non sono necessari, li ho messi solo per leggibilità
		v=$(( $RANDOM % (500-50) +50 ))
		((saldo+=v))
		storico[${#storico[@]}]="+$v"
		echo "Saldo aggiornato"
	fi
}

preleva() {
	read -p "Inserire valore da prelevare: " v
	if [ $v -gt 0 ] && [ $saldo -gt $v ]
	then
		((saldo-=v))
		storico[${#storico[@]}]="-$v"
		echo "Saldo aggiornato"
	else
		echo "Non è possibile prelevare quanto richiesto ($v)"
	fi
}

mostra_saldo() {
    echo "Saldo corrente: $saldo€"
}

history() {

	if [ $# -eq 0 ] || [ $# -eq 0 ]
	then
		echo "Storico completo:"
		for elem in ${storico[@]}
		do
			echo -n "$elem "
		done
		#Solo per andare a capo
		echo
	elif [ $1 -gt 0 ]
	then
		#Slicing, per questo punto NON c'era alcun limite implementativo.
		#Si poteva pensare a qualche controllo più fine
		#prima di stampare ma non era richiesto.
		echo ${storico[@]:0:$1}
	else
		echo "Parametro non valido ($1)"
	fi
}

saveTransactionsToFile() {
	location=$HOME/Desktop
	fileName=".transactions.txt"
	cd $location
	echo ${storico[@]} > $fileName

	read -p "Inserisci valore ad cercare nel file: " v
	grep -o $v $fileName
}

# Codice 'Main'
while true; do
	mostra_menu
	#Una soluzione efficace, ma non l'unica, per gestire l'evententuale parametro in ingresso alle funzioni.
    	read -p "Scegli: " c p
	case $c in
	1)
		versa $p
	;;
	2)
		preleva
	;;
	3)
		mostra_saldo
	;;
	4)
		saveTransactionsToFile
		echo "Chiusura..."
		exit 1
	;;
	5)
		history $p
	;;
	*)
		echo "Operazione non riconosciuta ($c)"
	;;
    	esac
done
