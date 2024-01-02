#!/bin/bash
: << ATC
Gostaria de chamar a sua atenção para um detalhe: neste script me referi a um 
elemento de vetor associativo empregando ${Animais[$Animal]} ao passo que me referi a um 
elemento de um vetor inteiro usando ${Sel[i]}. Ou seja, quando usamos uma variável 
como índice de um vetor inteiro, não precisamos prefixá-la com um cifrão ($), 
ao passo que no vetor associativo, o cifrão ( $) é obrigatório. 
ATC

# Separa animais selvagens e domésticos
declare -A Animais
Animais[cavalo]=doméstico               # Criando vetor para teste
Animais[zebra]=selvagem                 # Criando vetor para teste
Animais[gato]=doméstico                 # Criando vetor para teste
Animais[tigre]=selvagem                 # Criando vetor para teste
Animais[urso pardo]=selvagem            # Criando vetor para teste
for Animal in "${!Animais[@]}"          # Percorrendo vetor pelo índice
do
	if [[ "${Animais[$Animal]}" == selvagem ]]
	then
	    Sel=("${Sel[@]}" "$Animal")     # Concatenado novo animal no vetor selvagens
	else
	    Dom=("${Dom[@]}" "$Animal")     # Concatenado novo animal no vetor domésticos
	fi
done
#  Operador condicional, usado para descobrir qual
#+ vetor tem mais elementos. Veja detalhes na seção
#+ O interpretador aritmético do Shell
Maior=$[${#Dom[@]}>${#Sel[@]}?${#Dom[@]}:${#Sel[@]}]
clear
tput bold                                    # Cabeçalho
printf "%-15s%-15s\n" Domésticos Selvagens   # Cabeçalho
tput sgr0                                    # Cabeçalho

for ((i=0; i<$Maior; i++))
{
	tput cup $[1+i] 0; echo ${Dom[i]}
	tput cup $[1+i] 14; echo ${Sel[i]}
}
