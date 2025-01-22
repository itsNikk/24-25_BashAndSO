#!/bin/bash

read -p "Gimme the word to search: " word
read -p "Gimme the file to serach $word into: " file

#Conteggio più preciso rispetto alla V1 di questo esercizio.
count=$(grep -o $word $file | wc -l)

echo "La parola $word appare nel file $file $count volte."
