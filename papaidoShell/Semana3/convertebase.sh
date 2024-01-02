#!/bin/bash
function convertebase
{
	Base=$2
	Tamanho=${#1}
	Resultado=0
	for ((i=0;i<$Tamanho;i++))
	{
		Expoente=$(((Tamanho-1)-$i))
		Digito=${1:i:1}
		case $Digito in
			[01])	[ 2 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[2])	[ 3 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[3])	[ 4 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[4])	[ 5 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[5])	[ 6 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[6])	[ 7 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[7])	[ 8 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[8])	[ 9 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[9])	[ 10 -le $Base -a $Base -le 16 ] ||	{
															echo "Base inválida"
															exit 1
														};;
			[Aa])	[ 11 -le $Base -a $Base -le 16 ] && Digito=10 ||	{
																			echo "Base inválida"
																			exit 1
																		};;
			[Bb])	[ 12 -le $Base -a $Base -le 16 ] && Digito=11 ||	{
																			echo "Base inválida"
																			exit 1
																		};;
			[Cc])	[ 13 -le $Base -a $Base -le 16 ] && Digito=12 ||	{
																			echo "Base inválida"
																			exit 1
																		};;
			[Dd])	[ 14 -le $Base -a $Base -le 16 ] && Digito=13 ||	{
																			echo "Base inválida"
																			exit 1
																		};;
			[Ee])	[ 15 -le $Base -a $Base -le 16 ] && Digito=14 ||	{
																			echo "Base inválida"
																			exit 1
																		};;
			[Ff])	(($Base <= 16)) && Digito=15 ||			{
																echo "Base inválida"
																exit 1
															};;
			*) 
		esac
		Valor=$(( $Digito * ($Base**$Expoente) ))
		Resultado=$((Resultado+Valor))
	}

	echo $Resultado
}