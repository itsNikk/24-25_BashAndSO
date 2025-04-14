#!/bin/bash

cd $HOME/Desktop

dirName=$1

if [ ! -d $dirName ]
then
	echo "$dirName non è una directory"
	exit 1
fi

#Maxdepth 1 è qui per semplicità. E' ovvio che introduca una semplificazione della realtà
fileCount=$(find $dirName -maxdepth 1 -type f | wc -l)
subDirCount=$(find $dirName -maxdepth 1 -type d | wc -l)
shFilesCount=$(find $dirName -maxdepth 1 -type f -name "*.sh" | wc -l)

echo "Numero di file: $fileCount"
echo "Numero di sotto cartelle: $((subDirCount-1))"
echo "Numero di file .sh presenti: $shFilesCount"
