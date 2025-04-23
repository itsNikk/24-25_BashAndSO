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
	read -p "Inserire valore da versare: " v
	if [ $v -gt 0 ]
	then
		((saldo+=v))
		storico[${#storico[@]}]="+$v"
		echo "Saldo aggiornato"
	else
		echo "Valore non corretto per un prelievo ($v)"
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
	for elem in ${storico[@]}
	do
		echo -n "$elem "
	done
	echo
}

# Codice 'Main'
while true; do
    mostra_menu
    read -p "Scegli: " c 
    case $c in
	1)
		versa
	;;
	2)
		preleva
	;;
	3)
		mostra_saldo
	;;
	4)
		echo "Chiusura..."
		exit 1
	;;
	5)
		history
	;;
	*)
		echo "Operazione non riconosciuta ($c)"
	;;
    esac
done

