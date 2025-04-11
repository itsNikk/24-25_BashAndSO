#!/bin/bash

cd $HOME/Desktop

a=$1
b=$2


sum() {
echo $(( $1 + $2 ))
}

diff() {
echo $(( $1 - $2 ))
}

mult(){
echo $(( $1 * $2 ))
}

div() {
echo $(( $1 / $2 ))
}

read -p "Inserisci operazione (+, -, x, /): " op

case $op in

+)
sum $a $b
;;
-)
diff $a $b
;;
x)
mult $a $b
;;
/)
if [ $b -eq 0 ]
then
	echo "ERROR: Div by zero"
	exit 1
fi
div $a $b
;;
*)
echo "Operazione non riconosciuta ($op)"
;;
esac


