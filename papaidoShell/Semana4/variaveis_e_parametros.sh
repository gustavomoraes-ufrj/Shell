# PIPESTATUS

# who
# jneves   pts/0        Apr 11 16:26 (10.2.4.144)
# jneves   pts/1        Apr 12 12:04 (10.2.4.144)

who | grep ^botelho
echo ${PIPESTATUS[*]}
# 0 1


# RANDOM

# Para gerar randomicamente um inteiro entre 0 e 100, fazemos:

echo $((RANDOM%101))
# 73

# Ou seja, pegamos o resto da divisão por 101 do número randômico gerado, porque o resto da divisão 
# de qualquer número por 101 varia entre 0 e 100.

# Usando o mesmo raciocínio, para gerar entre 5 e 100, manda-se gerar até 96, ou seja de 0 a 95 e 
# depois soma-se 5 a este randômico gerado:

echo $((RANDOM%96+5))
# 49

# REPLY

read -p "Digite S ou N: "
# Digite S ou N: N
echo $REPLY
# N

# Bom exemplo de valor default p um S/n, por exemplo
read -p "Login na máquina remota ($LOGNAME): " ln
# $LOGNAME sendo oferecido como default
ln=${ln:-$LOGNAME}

# O oposto disso, mas também interessante

Var1=10; unset Var2; echo Var1 tem 10${Var2:+ e Var2 tem $Var2}
# Var1 tem 10
Var1=10; Var2=; echo Var1 tem 10${Var2:+ e Var2 tem $Var2}
#Var1 tem 10
Var1=10; Var2=20; echo Var1 tem 10${Var2:+ e Var2 tem $Var2}
#Var1 tem 10 e Var2 tem 20


cadeia="Casa da Mãe Joana"
echo ${cadeia#*' '}
# da Mãe Joana
echo Morada ${cadeia#*' '}
# Morada da Mãe Joana

# Neste exemplo foi suprimido à esquerda tudo que casasse com a menor ocorrência da expressão *' ',
# ou seja, tudo até o primeiro espaço em branco.


echo ${cadeia##*' '}
# Joana
echo Vou levar um papo com a ${cadeia##*' '}
# Vou levar um papo com a Joana

# Outro exemplo mais útil: para que não apareça o caminho (path) completo do seu programa (que,
# como já sabemos está contido na variável $0) em uma mensagem de erro, inicie o seu texto da
# seguinte forma:

 echo Uso: ${0##*/} texto da mensagem de erro 


# Para suprimir à direita da ocorrência de uma cadeia

# O uso do percentual (%) é como se olhássemos o jogo-da-velha (#) no espelho, isto é, 
# são simétricos. Então vejamos um exemplo para provar isso:

echo $cadeia
# Casa da Mãe Joana
echo ${cadeia%' '*}
# Casa da Mãe
echo ${cadeia%%' '*}
# Casa

echo $cadeia
# Casa da Mãe Joana
echo ${cadeia/Mãe/Vovó}
# Casa da Vovó Joana
echo ${cadeia/Mãe /}
# Casa da Joana

echo $cadeia
# Casa da Mãe Joana
echo ${cadeia/*a /Residência }
# Residência Mãe Joana

# A ideia era pegar tudo até o primeiro a (a seguido de espaço em branco), para trocar Casa 
# por Residência mas o que foi trocado foi tudo até o último a (a seguido de espaço em branco,
# que foi encontrado em da), Isto poderia ser resolvido de diversas maneiras, veja algumas:

echo ${cadeia/*sa/Residência}
# Residência da Mãe Joana
echo ${cadeia/????/Lar}
# Lar da Mãe Joana

#Trocando todas as ocorrências de uma subcadeia por outra.
echo ${cadeia//a/ha}
# Chasha dha Mãe Johanha

# Trocando uma subcadeia no início de uma variável

echo $Passaro
# quero quero
echo "Como diz o sulista - "${Passaro/#quero/não}
# Como diz o sulista - não quero

# Trocando uma subcadeia no fim de uma variável

echo "Como diz o nordestino - "${Passaro/%quero/não}
# Como diz o nordestino - quero não


# Para listar o valor de uma variável apontada por outra

# Digamos que o conteúdo da variável $a seja b e da variável $b seja 5. Veja como listar o 
# valor de $b a partir de $a:

a=b
b=5
echo ${!a}
# 5

Nome="botelho"
echo ${Nome^}	        # 1º letra em maiúscula
# Botelho
echo ${Nome^^}	# Todas as letras em maiúsculas
# BOTELHO
Nome="botelho carvalho"
echo ${Nome^}	        # 1º letra em maiúscula
# Botelho carvalho
Coisa="AAAbbb cccDDD"
echo ${Coisa~}	# Troca case da 1º letra
# aAAbbb CccDDD
echo ${Coisa~~}	# Troca case de todas as letras
# aaaBBB CCCddd

# Um fragmento de script que pode facilitar a sua vida:

read -p "Deseja continuar (S/n)? " # S maiúsculo (default)
[[ ${REPLY^} == N ]] && exit
