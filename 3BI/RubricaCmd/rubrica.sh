#!/bin/bash

APP_DIR="$HOME/.rubrica_app"
FILE="$APP_DIR/rubrica.txt"

# Crea la directory dell'app se non esiste
mkdir -p "$APP_DIR"

#Mostra mess aiuto all'utente
help() {
	echo "Utilizzo: $0 [opzione] [argomenti]"
	echo "Opzioni:"
	echo "-a      aggiungi contatto"
	echo "-r nome rimuovi contatto"
	echo "-s nome cerca un contatto"
	echo "-l elenca tutti i contatti"
	echo "-h help guide"
	exit 0
}

addContact(){
	echo "$1:$2" >> $FILE
	echo "Contatto aggiunto: $1-$2"
}

removeContact() {
	grep -v "^$1:" $FILE > "$FILE.tmp"
	mv "$FILE.tmp" $FILE
	echo "Removed contact $1"
}

searchContact() {
	searchResult=$(grep "^$1:" "$FILE")
	if [ -z "$searchResult" ]; then
		echo "Contatto non trovato: $1"
	else
		echo "Contatto trovato: $searchResult"
	fi
}

listContacts() {
	if [ ! -s $FILE ]; then
		echo "La rubrica è vuota"
	else
		cat $FILE
	fi
}

case $1 in
	-a)
	read -p "Inserisci nome: " nome
	read -p "Inserisci numero: " num
	addContact $nome $num
	;;
	-r)
	if [ $# -ne 2 ]; then
		help
		exit 1
	fi
	removeContact $2
	;;
	-s)
	if [ $# -ne 2 ]; then
		help
		exit 1
	fi
	searchContact $2
	;;
	-l)
	listContacts
	;;
	-h)
	help
	;;
	*)
	help
	;;

esac
