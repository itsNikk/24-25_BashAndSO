#!/bin/bash

# rm: rimuove file 
# rm -r cancellazione cartella (ricorsiva)
rm -rf progetto

# creare cartella progetto
mkdir progetto

cd progetto
mkdir src test doc

cd doc
# REDIREZIONE: > >>
echo "Questo è un progetto di esempio" > README.txt

cd ../src
nano main.c

touch ../test/test_case.txt
echo "Riga 1" >> test_case.txt
echo "Riga 2" >> test_case.txt
echo "Riga 3" >> test_case.txt

ls ..
