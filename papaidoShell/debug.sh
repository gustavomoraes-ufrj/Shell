#!/bin/bash

DEBUG=${1:-0}		#Passe o nível pelo $1

Debug(){
	[ $1 -le "$DEBUG" ] || return
	local prefixo

	case "$1" in
		1) prefixo="-- ";;
		2) prefixo="---- ";;
		3) prefixo="------ ";;
		*) echo "Mensagem não categorizada: $*"; return;;
	esac 
	shift

	echo -e "\033[33;1m$prefixo$*\033[m"
}

Debug 1 "Início do Programa"

i=0
max=5

Debug 2 "Vou entrar no while"

while [ "$i" -ne "$max" ]
do
	Debug 3 "Valor de \$i antes de incrementar:""$i"
	let i=$i+1
	Debug 3 "Valor de \$i após incrementar:""$i"

	echo "$i" 
done

Debug 2 "Saí do while"

echo Terminei

Debug 1 "Fim do programa"

# TXT="gritaria"

# TXT="     $TXT     "

# Debug TXT com espaços: ["$TXT"]
# TXT=$(echo "$TXT" | tr " " "!")
# Debug TXT com exclamações: ["$TXT"]

# TXT=$(echo $TXT | tr a-z A-Z)

# echo $TXT