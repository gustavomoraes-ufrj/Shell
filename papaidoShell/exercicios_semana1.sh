#!/bin/bash

#  Exercício 8: Escreva um comando grep que localize todos os CEPs do arquivo ender.

# Observações:

#     Não quero os registros inteiros de ender na saída, quero somente os CEPs encontrados;
#     Os CEPs estão armazenados no formato NN.NNN-NNN, onde cada N pode ser qualquer algarismo. 
echo "#############"
echo "# Questão 8 #"
echo "#############"

# Minha Resposta:
grep -oE '\<[0-9]{2}\.?[0-9]{3}-[0-9]{3}\>' ./ender

# Resposta do Professor:
grep -oE '\b[0-9]{2}\.[0-9]{3}-[0-9]{3}\b' ender

grep -oE '\<[0-9]{2}\.[0-9]{3}-[0-9]{3}\>' ender

grep -o '\b[0-9]\{2\}\.[0-9]\{3\}-[0-9]\{3\}\b' ender

grep -o '\b[0-9][0-9]\.[0-9][0-9][0-9]-[0-9][0-9][0-9]\b' ender

grep -o '\<[0-9][0-9]\.[0-9][0-9][0-9]-[0-9][0-9][0-9]\>' ender

echo " "
echo " "
echo " "


# Exercício 9: Já vou avisando: esse é chatinho! Até aqui aprendemos a usar poucos comandos. 
# Como eu posso listar o nome de todos os subdiretórios do diretório corrente usando apenas ls -l e grep? 

echo "#############"
echo "# Questão 9 #"
echo "#############"

# Resposta:
 ls -l | grep -E '^d' | grep -oE '[^ ]+$'

# Resposta do Professor:
 ls -l | grep ^d | grep -o '[^ ]*$'

echo " "
echo " "
echo " "


# Exercício 10: Como faço para listar, com um único grep, os registros de /etc/passwd 
# exceto os que estão no arquivo exclui? 

echo "#############"
echo "# Questão 10 #"
echo "#############"

# Resposta:
 grep -vf ./exclui /etc/passwd

# Resposta do Professor:
 grep -v -f exclui /etc/passwd 
 grep -vf exclui /etc/passwd

echo " "
echo " "
echo " "


