#!/bin/bash

read -p "Inserisci nome cartella" dirName

# perchè rm? Risposta: Cosa succede se eseguo più volte lo script con lo stesso nome di cartella?

rm -rf $dirName
mkdir $dirName

touch $dirName/file1.txt $dirName/file2.txt $dirName/file3.txt
