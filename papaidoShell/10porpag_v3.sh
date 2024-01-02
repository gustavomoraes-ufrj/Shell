#!/bin/bash
#  Prg de teste para escrever
#+ 10 linhas e parar para ler
#+ Versão 3

clear
while read Num
do
    let ContLin++                           # Contando...
    echo "$Num"
    ((ContLin % (`tput lines` - 3) == 0)) &&
        {
        read -n1 -p"Tecle Algo " < /dev/tty # para ler qq caractere
        clear                               # limpa a tela apos leitura
        }
done < numeros