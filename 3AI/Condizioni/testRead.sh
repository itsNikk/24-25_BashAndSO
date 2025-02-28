#!/bin/bash

#1) CHIEDI 2 num a utente = stdin = tastiera
# read=scanner

echo "dammi a: "
read a

# -p = prompt (il messaggio di input)
read -p "dammi b: " b

# espansione aritmetica
sum=$((a+b))

echo "$a + $b = $sum"

