#!/bin/bash

rm -rf $1

mkdir $1
cd $1
mkdir $2 $3

cd $2
touch bd_file1.txt bd_file2.txt bd_file3.txt
cd ..
cd $3
touch sd_file1.txt sd_file2.txt
cd ..

read -p "Inserisci il nome della cartella da visualizzare: " dirToView

ls $dirToView

read -p "Inserisci nome file (completo) da spsotare" fileToMove

mv $2/$fileToMove $3
