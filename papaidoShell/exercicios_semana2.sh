#!/bin/bash

# Exercício 1: Partindo de um ls -l, como faço para pegar o tamanho dos arquivos e seus nomes 
# (dica: veja a opção -s do comando tr) 

#Minha Resposta: 
ls -l | tr -s ' ' | cut -f5,9 -d' ' 

#Respostas do Professor:
ls -l | tr -s ' ' | cut -sf5,9 -d' ' 
ls -l | tr -s ' ' '\t' | cut -sf5,9  # Solução mais elegante :) 

# Obs: Não entendi o motivo do -s no comando cut, já que o resultado foi o mesmo nos dois casos

# Exercício 2: Quero alterar todos os programas do diretório corrente que possuem 
# a cadeia /home/treinandos/exercícios por /home/treinandos/exercícios. 
# Qual seria a forma mais legível de se fazer isso com o comando sed? 

#Minha Resposta: Obs: #entendi que seriam todos os programas c extensão .sh 
sed -i.veio 's@/home/treinandos/exercícios@/home/treinandos/exercícios@g' ./*.sh  # Seguro morreu de veio :)

#Respostas do Professor:
sed -i 's-/home/treinandos/exercícios-/home/treinandos/exercícios-g' *
sed -i 's/\/home\/alunos\/scripts/\/home\/treinandos\/exercícios/g' *

# Exercício 4: Qual o comando sed posso usar para realizar, no arquivo arq, 
# as trocas descritas na tabela abaixo? 
#	  Trocar 	Por
	# A ou a 	1
	# E ou e 	2
	# I ou i 	3
	# O ou o 	4
	# U ou u 	5
#Minha Resposta: 
# Regras.txt:
# s/[Aa]/1/g
# s/[Ee]/2/g
# s/[Ii]/3/g
# s/[Oo]/4/g
# s/[Uu]/5/g
sed -i.veio -f regras.txt arq

#Resposta do Professor:
sed 'y/AaEeIiOoUu/1122334455/' arq # Obs: Aprendido e internalizado c sucesso! \o/

# Exercício 5: Considere um arquivo, chamado numeros com o seguinte conteúdo:
# 1234567890
# 0987654321
# 1234554321
# 9876556789

# Qual comando irá gerar a seguinte saída:
# 12345
# 09876
# 12345
# 98765

#Minha Resposta: 
cut -c-5 numeros

#Resposta do Professor:
cut -c1-5 numeros


# Exercício 6: Considere um arquivo, chamado numeros com o seguinte conteúdo:

# 1234567890
# 0987654321
# 1234554321
# 9876556789

# Escreva o comando que gerará a seguinte saída:

# 13579
# 08642
# 13542
# 97568

#Minha Resposta: 
cut -c1,3,5,7,9 numeros

#Resposta do Professor:
cut -c1,3,5,7,9 numeros		# Primeira resposta idêntica :)


# Exercício 10: Utilize o comando tr para gerar um novo arquivo chamado saida.txt a partir 
# do arquivo entrada.txt, removendo todas as quebras de linha e substituindo-as 
# por espaços em branco. 

#Minha Resposta: 
tr '\n' ' ' < entrada.txt > saida.txt

#Resposta do Professor:
tr '\n' ' ' < entrada.txt > saida.txt	# Obs: Yes!


# Exercício 11: Um erro bastante comum na edição de textos é a inclusão de caracteres repetidos, 
# particularmente espaços em branco. O comando tr possui a diretiva -s (--squeeze-repeats) 
# que faz exatamente isto, suprime caracteres repetidos substituindo por apenas um deles 
# ou então por algum outro caractere que desejarmos. Qual o comando devemos utilizar para 
# substituir todos os espaços em branco consecutivos do arquivo arquivo.txt por apenas um? 

#Minha Resposta: 
tr -s ' ' < arquivo.txt

#Resposta do Professor:
tr -s ' ' < arquivo.txt


# Exercício 15: Como faço para pegar somente o último parâmetro que foi passado? 
# (dica: para você testar direto no prompt faça set a b c e em seguida faça 
# 	echo $0; echo $1; echo $3. Viu!? 
# 	Você passou 3 parâmetros para o Bash e agora pode testá-los no prompt. 
# 	Se você fizer set p1 p2 p3 p4, esses 4 serão os novos parâmetros). 

#Minha Resposta: 
# Essa confesso q não consegui e olhei a resposta. :(


#Resposta do Professor:
shift $(($# - 1))
echo $1
