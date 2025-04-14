#!/bin/bash

cd $HOME/Desktop

read -p "Inserisci nome file per lista della spesa: " listName

if [ -f $listName ]
then
	touch $listName
fi

for index in $(seq 1 3)
do
read -p "Inserisci prodotto numero $index: " newp
echo $newp >> $listName
done

echo "Lista salvata!"

cat $listName
