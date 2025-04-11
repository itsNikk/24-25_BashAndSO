#!/bin/bash

cd $HOME/Desktop

read -p "Inserisci nome file: " file

if [ -f $file ]
then
	echo "Il file esiste già"
else
	echo "Creato il $(date)" > $file
fi
