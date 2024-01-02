#!/bin/bash

[[ $# -ne 1  ]] &&	{
						echo "O programa não recebeu o número adequado de parâmetros (1)."
						exit 1
					}

[[ ! -f $1 ]] &&	{
						echo "Arquivo fornecido não existe"
						exit 2
					}

CONT=0
for palavra in $(cat $1)
{
	# CONT=$(($CONT + 1))
	# let CONT=$CONT+1
	# let CONT++
	echo $((++CONT))  # Testei formas diferentes p incrementar a var CONT não contava com esse resultado aplicado ao echo
					  #  achei que essa não fosse funcionar
} 

echo "O Arquivo \"$1\" contém $CONT palavras"
