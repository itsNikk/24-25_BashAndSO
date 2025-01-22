#!/bin/bash

read -p "Inserisci il pattern da cercare: " pattern
read -p "Inserisci il nome del file dove cercarlo: " fileName

grep $pattern $fileName

