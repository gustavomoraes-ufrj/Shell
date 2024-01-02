#!/bin/bash

#  	Testando programa com Help -h
#	Autor: Gustavo
#	Funcionamento: ./testeDialog.sh 
#   Versão 1:	Mostra os usuários do sistema separados por TAB
#	Versão 2:	Mostra as opções de ajuda com -h
#	Versão 3: 	Mostra versão do programa
#	Versão 4:	Arrumando BUG quando nõa tem opções, basename no nome do programa,
#				-V extraindo direto dos cabeçalhos, adicionadas opções --version e --help
#	Versão 5: 	Função ordenar incluída
#	Versão 6:	Inverte (reverse) e converte letras para maiúsculas (upper)
#				Leitura de múltiplas opções (loop)
#	Versão 7:	Adicionada a opção de definir o delimitador -d, --delim

MENSAGEM="
	Uso: $(basename "$0")  [opções]
	
	Opções:
	[-h|-V|-s|-r|-u|-d C] 
	-r, --reverse 	Inverte a ordem da apresentação
	-d, --delim C	Define como C o delimitador
	-u, --uppercase Converte as letras para maiúsculas
	-s, --sort		Ordena alfabeticamente a lista 
	-h, --help 		Mostra esta tela de ajuda e sai
	-V, --version	Mostra a versão do programa e sai
"

ORDENA=0
UPPERCASE=0
REVERSE=0
DELIM="\t"
while [ -n "$1" ]
do
	case "$1" in
		-u|--uppercase)	UPPERCASE=1	;;
		-r|--reverse)	REVERSE=1	;;
		-s|--sort)		ORDENA=1	;;
		-d|--delim)
			shift
			DELIM="$1"

			if [ -z "$DELIM" ]	
			then
				echo "Parâmetro inválido para -d!"
				exit 1
			fi
		;;
		-h|--help)
			echo "$MENSAGEM"
			exit 0	
		;;
		-V|--version)
			#Mostra a versão
			echo -n $(basename "$0")
			egrep "^#	Versão" "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;
		*)
			#Opção inválida
			if [ -n "$1" ] 
			then 
				echo Opção inválida "$1"
				exit 1
			fi
		;;
	esac

	shift	
done

LISTA=$(cut -d : -f 1,5 /etc/passwd)

[ "$ORDENA" = "1" ] &&	LISTA=$(echo "$LISTA" | sort)
[ "$UPPERCASE" = "1" ] && LISTA=$(echo "$LISTA" | tr a-z A-Z)
[ "$REVERSE" = "1" ] &&	LISTA=$(echo "$LISTA" | tac)

echo "$LISTA" | tr -d , | tr : "$DELIM" 


