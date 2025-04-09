#!/bin/bash

# $#=
# conta quanti parametri ci sono da cmdLine
if [ $# -ne 2 ]
then
	echo "Devi inserire due paramtri"
	exit 1
fi

dir=$1
len=$2

# $HOME=TILDE
cd $HOME/Desktop

#!=NOT
if [ ! -d ".secretDir/$dir" ]
then
	mkdir ".secretDir"
	cd ".secretDir"
	mkdir $dir
	cd $dir
else
	cd ".secretDir/$dir"
fi

arr=()
read -p "Insersci min e poi max: " min max

for x in $(seq 0 $((len-1)))
do
	arr[$x]=$(($RANDOM % ($max-$min)+$min))
done

echo ${arr[@]}

filter() {
#res è lungo 0...
res=()
for elem in ${arr[@]}
do
	if [ $(($elem % $1)) -eq 0 ]
	then
		res[${#res[@]}]=$elem
	fi
done
echo ${res[@]}
}
