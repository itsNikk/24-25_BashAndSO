#!/bin/bash

# uso clear solo per pulire la shell prima di iniziare una nuova eseecuzione.
clear

gridSize=$1
halfGrid=$((gridSize/2))

point=(0 0)

#Init
echo "Inizializzata griglia $gridSize X $gridSize"
echo "Il punto inizia in (${point[@]})"

while true
do
	read -p "dove muovere? (w=su a=sx d=dx s=giu e=esci): " move

	if [ $move == "e" ]
	then
		echo "Fine programma"
		exit 0
	fi

	if [ $move != "w" ] && [ $move != "a" ] && [ $move != "s" ] && [ $move != "d" ]
	then
		echo "Direzione non valida! ($move)"
	else

		read -p "Quanto muovo?: " amount

		newX=${point[0]}
		newY=${point[1]}

		if [ $move == "w" ]
		then
			newY=$((point[1]+amount))
		elif [ $move == "s" ]
		then
			newY=$((point[1]-amount))
		elif [ $move == "a" ]
		then
			newX=$((point[0]-amount))

		elif [ $move == "d" ]
		then
			newX=$((point[0]+amount))
		else
			echo "Direzione non valida! ($move)"
		fi

		if [ $newX -lt -$halfGrid ] || [ $newX -gt $halfGrid ] || [ $newY -lt -$halfGrid ] || [ $newY -gt $halfGrid ]
		then
			echo "Non è possibile spostarsi oltre i bordi"
		else
			point=($newX $newY)
		fi
		
		echo ${point[@]}
	fi
done
