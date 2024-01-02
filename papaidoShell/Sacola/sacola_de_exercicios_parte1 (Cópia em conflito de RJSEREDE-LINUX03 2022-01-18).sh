#!/bin/bash
: << Exercício1
Fazer, no prompt, uma função que receba dois números como parâmetro e informe o produto deles: 
Exercício1
# Minha resposta:
# $ function Mult
# > {
# > 	echo $(($1 * $2))
# > }

# #Resposta do prof:
# $ function Mul
# > {
# >     echo $(($1*$2))
# > }

: << Exercício2
Escrever uma função de forma a que você possa chamá-la em qualquer programa (então não pode estar
no prompt), que recebe como parâmetro o primeiro operador, o sinal da operação e o segundo 
operador. 
Exercício2
# Minha resposta:
function Opera
{
	echo $(($1 $2 $3))
}

Opera 1 + 2

# Resposta do prof:
function Calcula 
{
    declare Op=$1 Op3=$3
    [[ $2 =~ \+|-|\*|/|%|\*\* ]] || {
        echo "Sinais permitidos + - * / % **" >&2
        return 1
    }
    if [[ $2 == / ]] && [[ $3 == 0 ]]
    then
        echo Divisão errada >&2
        return 1
    fi
    echo $((Op1 $2 Op3)) || 
        echo Escreva a operação desejada. Ex. 3 - 5 >&2
}


: << Exercício3
Dado um ano, informe se é um ano bissexto.

A regra é que ocorre um ano bissexto no calendário gregoriano quando:

    Em cada ano que é divisível por 4;
        Exceto os anos que também são divisíveis por 100;
            A não ser que o ano também seja também divisível por 400

Por exemplo, 2015 não foi um ano bissexto (não é divisível por 4), mas 2016 foi. 
1900 não foi um ano bissexto (é divisível por 100), mas 2000 foi (é divisivel por 400). 
Exercício3
# Minha resposta:
function Bissexto
{
	(($1 % 400 == 0)) && {
							echo Bissexto
						} ||	{ 
									(($1 % 4 == 0 && $1 % 100 != 0 )) && echo Bissexto || echo Não Bissexto
								}
}

# Resposta do prof:
if [[ $# -ne 1 ]]             # Testa se recebeu 1 parâmetro
then
    echo "Uso: $0 " >&2  # Manda mensagem para stderr
    exit 1 
fi

[[ $1 =~ [0-9]{4} ]] || {     # Oparâmetro tem 4 algarismos?
    echo "Uso: $0 " >&2  # Manda mensagem para stderr
    exit 1 
}

if  (($1 % 400 == 0))         # Se for multiplo de 400, tb será de 4
then
    echo bissexto
else
    if  (($1 % 4 == 0)) && (($1 % 100 != 0)) # Multiplo de 4 e não de 100?
    then
        echo bissexto
    else
        echo não bissexto
    fi
fi


: << Exercício4
Fazer um script que recebe um texto com diversas palavras e escreve-o invertido, 
como no exemplo a seguir:

$ inverte.sh Rubens Queiroz
zorieuQ snebuR

Dica: atenção com os espaços, <TAB>s e <ENTER>s!

Observação: Usar somente os seguintes comandos: echo, for e Expansão de Parâmetros. 
Exercício4
#Minha resposta:
Texto=$*
TamTexto=${#Texto}

for ((i=$TamTexto-1;i>=0;i--))
{
	echo -en "${Texto:$i:1}"
}

#Resposta do Prof:
#  Prg para treinar expansão de parâmetros

Var="$@"
for ((Pos=${#Var}-1; Pos>=0; Pos--))
do
    echo -n "${Var:$Pos:1}"
done; echo

: << Exercício5
Como Shell também é cultura, vou sair do assunto e explicar tudo sobre cartões de crédito, 
que são cheios de macetes e detalhes muito pouco conhecidos.

Os cartões de crédito e débito só podem começar com 3, 4, 5 e 6. Se o número do cartão começa 
com outro dígito, ele tem outro fim: programa de fidelidade, por exemplo.

Seu formato geral é o seguinte:

4220 6193 1234 567X

Onde:
4220 61 	Identifica a bandeira do cartão (as mais comuns são:
Visa: a sequência começa com 4
Mastercard: começa com 51 - 55
American Express: começa com 34 ou 37)
93 1234 567 	Identifica o portador (dono)
X 	É o DV, que é o que nós vamos aprender a calcular para fazermos uma função para só aceitar 
cartões de crédito ou de débito válidos

O cálculo do dígito verificador simples: você multiplica os algarismos de ordem ímpar (primeiro, 
terceiro, quinto, ..., décimo quinto) por 2. Se isso resultar em algum número com dois dígitos, 
você soma os dois (por exemplo, 18 vira 1+8=9). Depois some tudo, e adicione os de ordem par 
(segundo, quarto, ..., décimo quarto) dígito. Suponha que o resultado deu 82. 
Quanto falta para chegar a um múltiplo de dez? 8. 
Então o dígito verificador é 8.

O script deve receber o número do cartão com 14 ou 15 algarismos, isto é, sem o DV e informar o 
DV e a operadora do cartão.

Observação: Vamos trabalhar com cartões de 16 algarismos, porém o sem o DV serão 15 e o Americam 
Express tem um algarismo a menos que deve ser prenchido com zero à esquerda.

No cartão 4220 6193 1234 567X o script informou que é um Visa e o DV ( X) era 4.

$ dvcc.sh
Número do cartão: 422061931234567 #Informando nº do cartão
Operadora do cartão é Visa
E o DV é 4
Exercício5
# Minha Resposta
read -p "Número do cartão: " Numero

echo ${#Numero}

((${#Numero} == 14 || ${#Numero} == 15)) || { 
												echo Cartão inválido 
												exit 3
											}

Bandeira=${Numero:0:2}

case $Bandeira in
	4[0-9])	echo Operadora do cartão: Visa ;;
	5[15])  echo Operadora do cartão: Master ;;
	3[47])  echo Operadora do cartão: American ;;
	*)		echo A operadora do cartão não foi reconhecida
			exit 1
esac  

Soma=0

for i in $(seq 0 1 14) 
{
	((i%2==0)) && Mult=2 || Mult=1

    let Alg=${Numero:$i:1}*$Mult
    Alg=$((Alg>9 ? Alg-9 : Alg))  # Se Numero > 10 soma seus algarísmos
    let Soma+=Alg
}

Mod=$((10-Soma%10))

DV=$(($Mod%10))

echo Dígito Verificador: $DV

# Resposta do Prof:
# Calcula DV e indica operadora de cartão de débito/crédito

read -p "Número do cartão: " Num
[[ ${#Num} =~ 1[45] ]] || {  # Só aceita cartão com 14 ou 15 algarísmos
    echo Uso: $0 '' >&2
    exit 1
}
case ${Num:0:2} in    # Pega 2 algarismos para decobrir operadora
       4?) Oper=Visa ;;
    3[47]) Oper=American\ Express ;;
    5[15]) Oper=MasterCard ;;
esac
printf -v Num '%015i' $Num   # Inclui 0 esquerda para American Express 
Soma=0
Mul=212121212121212
for ((Pos=0; Pos<${#Num}; Pos++))
{
    let Alg=${Num:$Pos:1}*${Mul:$Pos:1}
    Alg=$((Alg>9 ? Alg-9 : Alg))  # Se Numero > 10 soma seus algarísmos
    let Soma+=Alg
}
echo "Operadora do cartão é $Oper
E o DV é $(((10-Soma%10)%10))"

