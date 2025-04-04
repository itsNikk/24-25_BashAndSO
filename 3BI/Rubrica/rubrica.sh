#!/bin/bash

APP_DIR="$HOME/.rubrica_app"
FILE="$APP_DIR/rubrica.txt"

# Crea la directory dell'app se non esiste
mkdir -p "$APP_DIR"

# Help message
help() {
  echo "Utilizzo: $0 [opzione] [argomenti]"
  echo "Opzioni:"
  echo "  -a "nome numero"  Aggiungi un nuovo contatto."
  echo "  -r nome           Rimuovi un contatto."
  echo "  -s nome           Cerca un contatto per nome."
  echo "  -l                Elenca tutti i contatti."
  exit 0
}


add_contact() {
  echo "$1:$2" >> "$FILE"
  echo "Contatto aggiunto: $1 - $2"
}

remove_contact() {
  grep -v "^$1:" "$FILE" > "$FILE.tmp"
  mv "$FILE.tmp" "$FILE"
  echo "Contatto rimosso: $1"
}

search_contact() {
  result=$(grep "^$1:" "$FILE")
  if [ -z "$result" ]; then
    echo "Contatto non trovato: $1"
  else
    echo "Contatto trovato: $result"
  fi
}

list_contacts() {
  if [ ! -s "$FILE" ]; then
    echo "La rubrica è vuota."
  else
    cat "$FILE"
  fi
}

case "$1" in
  -a)
    read -p "Inserisci il nome: " nome
    read -p "Inserisci il numero: " numero
    if [ -z "$nome" ] || [ -z "$numero" ]; then 
	echo "Errore: specificare nome e numero."; 
	exit 1;
    fi
    add_contact "$nome" "$numero"
    ;;
  -r)
    if [ $# -ne 2 ]; then
	echo "Errore: specificare il nome."
	exit 1
    fi
	remove_contact "$2"
    ;;
  -s)
	if [ $# -eq 2 ]; then 
		echo "Errore: specificare il nome."
		exit 1
	fi
	search_contact "$2"
    ;;
  -l)
    list_contacts
    ;;
  *)
    help
    ;;
esac
