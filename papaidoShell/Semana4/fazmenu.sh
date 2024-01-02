#!/bin/bash
#
# Lista numerando os programas com extensão .sh no
# diretório corrente e executa o escolhido pelo operador
#
function Erro
{
    echo "
    ***************ERRO***************
    Uso: $0 NNN, onde NNN é uma das opções apresentadas"
    exit 1
}
clear; i=1
printf "%11s\t%s\n\n" Opção Programa
CASE='case $opt in'
for arq in *.sh
do
    printf "\t%03d\t%s\n" $i $arq
    CASE="$CASE
        "$(printf "%03d)\t %s;;" $i $arq)
    i=$((i+1))
done
printf "\t%d\t%s\n\n" 999 "Fim do programa" # Linha incluida
CASE="$CASE
        999)     exit;;                     # Linha incluida
          *)     Erro;;
esac"
read -n3 -p "Informe a opção desejada: " opt
printf -v opt '%03d' $opt		# Preenche $opt com zeros à esquerda
echo
eval "$CASE"