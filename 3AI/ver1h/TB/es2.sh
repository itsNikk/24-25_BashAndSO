#!/bin/bash

cd $HOME/Desktop

if [ -z $1 ]
then
	echo "Il primo parametro deve avere almeno una carattere"
	exit 1
fi


if [ $2 -lt 10 ] || [ $2 -gt 20 ]
then
	echo "Il secondo parametro deve essere nel range [10,20]"
	exit 1
fi

fname=$1
R=$2

if [ -f $fname ]
then
	touch $fname
fi

insertData() {

	for i in $(seq 1 $R)
	do
		s=$(( ($RANDOM % (2*R)) + 1))
		x=$(( ($RANDOM % (30-15)) + 15))
		y=$(( $RANDOM % 2))

		if [ $y -eq 0 ]
		then
			sensorState="Si"
		else
			sensorState="No"
		fi

		echo "Sensore-$s: Temperatura:${x}C° Attivo:$sensorState" >> $fname
	done


}

insertData
