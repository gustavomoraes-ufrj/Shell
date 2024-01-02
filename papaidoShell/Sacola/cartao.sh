#!/bin/bash
read -p "Número do cartão: " Numero

echo ${#Numero}

((${#Numero} == 14 || ${#Numero} == 15)) || { 
												echo Cartão inválido 
												exit 3
											}

Bandeira=${Numero:0:2}

case $Bandeira in
	4[0-9])	echo Operadora do cartão: Visa ;;
	5[15])  echo Operadora do cartão: Master ;;
	3[47])  echo Operadora do cartão: American ;;
	*)		echo A operadora do cartão não foi reconhecida
			exit 1
esac  

Soma=0

for i in $(seq 0 1 14) 
{

	((i%2==0)) && Mult=2 || Mult=1

    let Alg=${Numero:$i:1}*$Mult
    Alg=$((Alg>9 ? Alg-9 : Alg))  # Se Numero > 10 soma seus algarísmos
    let Soma+=Alg
}

Mod=$((10-Soma%10))

DV=$(($Mod%10))

echo $DV