#!/bin/bash

fileName=$1
dirName=$2

rm -rf $dirName
mkdir $dirName
echo "Intestazione di $fileName" > $dirName/$fileName

cd $dirName
cp $fileName ${fileName}_copia.txt
echo "Seconda riga per il file copiato..." >> ${fileName}_copia.txt

rm $fileName
