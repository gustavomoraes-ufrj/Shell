#!/bin/bash
# Exemplo de read passando arquivo de frutas por pipe.

while read Fruta
do
    echo $((++ContaFruta)) $Fruta  # Incrementa contador e lista-o com cada fruta
done < frutas

echo Meu arquivo tem :$ContaFruta: frutas cadastradas