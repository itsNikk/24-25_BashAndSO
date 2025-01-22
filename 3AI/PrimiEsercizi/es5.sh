#!/bin/bash

radius=$1
#Approssimazione derivata dal fatto che Bash non comprende nativamente numer iin virgola mobile
PI=3

echo "Il perimetro di un cerchio con raggio pari a $radius é: $((2*PI*radius))"
