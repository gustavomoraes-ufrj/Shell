#!/bin/bash

#  	Testando programa com Help -h
#	Autor: Gustavo
#	Funcionamento: ./testeDialog.sh 
#   Versão 1:	Mostra os usuários do sistema separados por TAB
#	Versão 2:	Mostra as opções de ajuda com -h

MENSAGEM="

Uso: "$0" [-h] 


	-h 		Mostra esta tela de ajuda e sai


"
if [ "$1" = "-h" ]
then
		echo $MENSAGEM
		exit 0	
fi

cut -d : -f 1,5 /etc/passwd | tr : \\t
