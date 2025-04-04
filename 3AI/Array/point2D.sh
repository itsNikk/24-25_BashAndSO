#!/bin/bash


# uso clear solo per pulire la shell prima di iniziare una nuova eseecuzione.
clear
point=(0 0)

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

		if [ $move == "w" ]
		then
			((point[1]+=amount))
		elif [ $move == "s" ]
		then
			((point[1]-=amount))
		elif [ $move == "a" ]
		then
			((point[0]-=amount))
		elif [ $move == "d" ]
		then
			((point[0]+=amount))
		else
			echo "Direzione non valida! ($move)"
		fi

		echo ${point[@]}
	fi
done
