#!/bin/bash

while read Arq
do 
	((i++))
	echo -e $Arq
done < <(ls -l / | tail -n +2 | tr -s ' ' |cut -d' ' -f5,9 --output-delimiter '=====')

echo Total de $i arquivos