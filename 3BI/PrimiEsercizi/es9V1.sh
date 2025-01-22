#!/bin/bash

read -p "Gimme the word to search: " word
read -p "Gimme the file to serach $word into: " file

#Conteggio meno preciso, ci ragioneremo su ;)
count=$(grep -c $word $file)

echo "La parola $word appare nel file $file $count volte."
