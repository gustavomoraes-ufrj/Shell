#!/bin/bash

#  1. Como posso listar de 1 a 10 em duas colunas, uma com impares e outra com pares?

# Comandos válidos:
# seq e xargs 

echo -e "Minha resposta:\n"
seq 10 | xargs -L2


echo -e "\n\n\n"


#  2. Salve a saída do exercício anterior no arquivo nums (se não conseguiu fazer o exercício, crie o arquivo em um editor).

# E aí vem a dolorosa pergunta: Como posso botar um cabeçalho "I P" (Impares Pares) antes dos dados?

# Comandos válidos:

# Para fazer este cabeçalho basta o cat. 

# Salvando o resultado em um arquivo
seq 10 | xargs -L2 > nums

# Usando o cat para gerar o header
echo -e "Minha resposta:\n"
echo 'I P' | cat - nums    # Perdi um chopp por usar o Echo, né... :(

# Outra solução sem o echo
echo -e "Outra resposta (sem o echo):\n"
cat - nums <<< 'I P'  

echo -e "\n\n\n"


#  3. Se você fizer:

# $ seq -w 30 | paste -d: - - - - -

# Obterá:

# 01:02:03:04:05
# 06:07:08:09:10
# 11:12:13:14:15
# 16:17:18:19:20
# 21:22:23:24:25
# 26:27:28:29:30

# Após esse, que comando devo executar para que a saída seja:

# 01:02:03=04=05
# 06:07:08=09=10
# 11:12:13=14=15
# 16:17:18=19=20
# 21:22:23=24=25
# 26:27:28=29=30

# Isto é o a linha de comandos que vimos acima, deve ser passada (por pipe) para outro comando que 
# trocará os dois pontos (:) pelo sinal de igual (=), mas só a partir do terceiro.

# Comandos válidos:

# Somente um sed 
echo -e "Minha resposta:\n"
seq -w 30 | paste -d: - - - - - | sed 's/:/=/g3'

echo -e "\n\n\n"

# 4. Conte-me o que houve que este comando deu esta saída:

# sed 'ss\ssusg' <<< sussurar
# uuuuurar

# R: A expressão para substituição utilizando o comando sed utilizou o caracter "s" como separador. 
# Qualquer caracter pode ser usado neste caso, porém a boa prática recomenda não utilizar como separador
# um caracter que dificulte a leitura da string. O caracter "/" é o padrão para a string de substituição.

# Abaixo substituo o "s" pela "/" para produzir o mesmo resultado:

sed 's/s/u/g' <<< sussurar

# Trata-se de uma simples substituição dos caracteres "s" pelo caracter "u"