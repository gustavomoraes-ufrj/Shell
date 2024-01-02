#!/bin/bash
# Script bobo para testar
# o comando tput (versao 1)

Colunas=`tput cols`           #  Salvando quantidade colunas
Linhas=`tput lines`           #  Salvando quantidade linhas
Linha=$((Linhas / 2))         #  Qual eh a linha do meio da tela?
Coluna=$(((Colunas - 9) / 2)) #  Calculando coluna para centrar na tela
tput sc                       #  Salvando posição do cursor
tput cup $Linha $Coluna       #  Posicionando para escrever
tput rev                      #  Video reverso
echo Alô Mundo
tput sgr0                     #  Restaura video ao normal
tput rc                       #  Restaura cursor aa posição original
