#!/bin/bash

TAM=${#1}
SOMA=0
for ((i=0;i<=$TAM-1;i++))
{
	NUM=${1:$i:1}
	SOMA=$(($SOMA + $NUM))
}

NOVES=$(($SOMA % 9))
echo $NOVES


Soma=0
for ((i=1; i<=5; i++))
{
    Num=$(cut -c$i <<< $1) # Num recebe cada algarismo do parâmetro
    [[ $Num =~ [0-9] ]] || return 1
    let Soma+=Num
}
echo $1 noves fora $((Soma%9))
