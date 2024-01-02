#!/bin/bash
Tudo=$(eval echo {$1..$2})              # Recebe os num. entre $1 e $2
for ((i=0; i<${#Tudo}; i++))
{
[ ${Tudo:i:1} ] || continue         # Espaço entre 2 números
let Algarismo[${Tudo:i:1}]++        # Incrementa vetor do algarismo
}
for ((i=0; i<=9; i++))
{
printf "Algarismo %d = %2d\n" \
    $i ${Algarismo[$i]:-0}          # Se o elemento for vazio, lista zero
}