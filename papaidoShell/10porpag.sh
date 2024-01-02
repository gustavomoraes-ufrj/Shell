#!/bin/bash
#  Prg de teste para escrever
#+ 10 linhas e parar para ler
#+ Versão 1

while read Num
do
    let ContLin++           # Contando...
    echo -n "$Num "         # -n para nao saltar linha
    ((ContLin % 10 == 0)) && read < /dev/tty
done < numeros