#!/bin/bash

clear

name=""
capitale=0
eventi=()

spezieVendute=0
vinoVenduto=0
cavalliAcquistati=0
tassePagate=0
pioggiaSubita=0

init() {
	read -p "Il tuo nome? " name
	if [ -z $name ]
	then
		name="MercanteGranpasso"
	fi
	capitale=$(( RANDOM % (100-20) +20 ))
	echo "Benvenuto $name. Il suo capitale è di $capitale."
}

simulateWeek(){

	for i in {1..7}
	do
		echo "=== Giorno $i ==="
		action=$((RANDOM % 5))
		case $action in
			0)
				eventi[${#eventi[@]}]="Vendi spezie:$capitale"
				((capitale+=15))
				((spezieVendute++))
				echo "Oggi ha venduto delle spezie. Il suo capitale aumenta di 15 monete ($capitale)"
			;;
			1)
				eventi[${#eventi[@]}]="Acquisti cavallo:$capitale"
				((capitale-=40))
				((cavalliAcquistati++))
				echo "Oggi ha acquistato un cavallo. Il suo capitale diminuisce di 40 monete ($capitale)"
			;;
			2)
				eventi[${#eventi[@]}]="Vendi vino:$capitale"
				((capitale+=20))
				((vinoVenduto++))
				echo "Oggi ha venduto del vino. Il suo capitale aumenta di 20 monete ($capitale)"
			;;
			3)
				eventi[${#eventi[@]}]="Tassazione regale:$capitale"
				((capitale-=10))
				((tassePagate++))
				echo "Oggi è stato tassato dai reali. Il suo capitale diminuisce di 10 monete ($capitale)"
			;;
			4)
				eventi[${#eventi[@]}]="Pioggia rovina bancarella:$capitale"
				((capitale-=25))
				((pioggiaSubita++))
				echo "Oggi la pioggia ha danneggiato la sua bancarella. Il suo capitale diminuisce di 25 monete ($capitale)"
			;;
		esac
		if [ $capitale -le 0 ]
		then
			echo "$name, sfortunatamente il suo patrimonio si è esaurito."
			showReport
			exit 0
		fi
	done

}

showReport() {
	echo -e "\nEcco il report della settimana"
	#Dettaglio, senza virgolette "" non otterremmo il risultato sperato... perchè?
	for evento in "${eventi[@]}"
	do
		echo "$evento"
	done
	echo "Capitale finale: $capitale"
	echo
	echo "Vino venduto: $vinoVenduto"
	echo "Cavalli Acquistati: $cavalliAcquistati"
	echo "Pioggia subita: $pioggiaSubita"
	echo "Tasse pagate: $vinoVenduto"
	echo "Spezie vendute: $spezieVendute"

}

init
simulateWeek
showReport
