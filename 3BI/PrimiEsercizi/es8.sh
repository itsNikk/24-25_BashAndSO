#!/bin/bash

rows=$(wc -l < $1)
echo "Il file $1 contiene $rows righe"
