#!/bin/bash

# time for((i=1; i <= 200; i++))
# {
# 	touch arq
# }

# time for((i=1; i <= 200; i++))
# {
# 	> arq
# }

# Questão 1
#  1. Como posso listar o terceiro registro do arquivo /etc/passwd? 
echo "#############"
echo "# Questão 1 #"
echo "#############"
grep -nE ':' /etc/passwd | grep -E '^3[^0-9].*$' 

echo " "
echo " "
echo " "

#Questão 2
#  2. Sabendo que os campos de /etc/passwd são separados por dois pontos e o leiaute de seus 4 primeiros campos é:

#  UserName:x:UID:GID: 

# Bolar uma forma de listar o UserName de todos os registros que tiverem o mesmo número de UID e de GID.

# Observação

#     UID - User Id - Número com a identificação do usuário;
#     GID - Group Id - Número com a identificação do grupo do usuário 

# Comando válido: grep 
echo "#############"
echo "# Questão 2 #"
echo "#############"
grep -E '([A-Za-z0-9_-]+):x:([0-9]+):\2:' /etc/passwd | grep -oE '^[A-Za-z0-9_-]+'

echo " "
echo " "
echo " "

#  3. Quero mandar para saída somente a segunda linha após o usuário sync do /etc/passwd.

# Comandos validos: grep e tail

echo "#############"
echo "# Questão 3 #"
echo "#############"

grep -nE '^sync' /etc/passwd | tail -n +$(grep -oE '^[0-9]+') /etc/passwd | grep -nE ':' | grep -E '^3:'

echo " "
echo " "
echo " "
