: << Exercício7

Fazer um script para calcular os digitos verificadores e identificar a orígem (a região fiscal, antiga URO) 
de um CPF.. Um CPF tem a seguinte formatação:
NNN NNN NNO-DV
Exercício7
# Minha Resposta:

function CalculaDV
{
	local Soma=0
	local Prod=0
	local Resultado
	(( ${#1} == 10 )) && Mult=0 || Mult=1
	for i in $(seq 0 1 $((${#1} - 1)))
	{
	    let Prod=${1:$i:1}*$Mult
	    let Soma+=Prod
	    ((Mult++))
	}

	Resultado=$((Soma % 11 % 10))

	echo $Resultado
}

read -n3 -p "CPF: " Cpf1; read -n3 -p"." Cpf2; read -n3 -p"." Cpf3; read -n2 -p"-" Dv

[[ $Cpf1$Cpf2$Cpf3$Dv =~ ^[0-9]{11}$ ]] || {
    echo -e "\n CPF inválido"
    exit 2
}

Corpo=$Cpf1$Cpf2$Cpf3
Regiao=${Cpf3: -1}

Dv1=$(CalculaDV $Corpo)
Dv2=$(CalculaDV $Corpo$Dv1)

(($Dv1$Dv2 == $Dv)) ||	{	
							echo Dígito verificador inválido!!!
							exit 1
						}

case $Regiao in
    1) Cidade="Brasília" ;;
    2) Cidade="Belém" ;;
    3) Cidade="Fortaleza" ;;
    4) Cidade="Recife" ;;
    5) Cidade="Salvador" ;;
    6) Cidade="Belo Horizonte" ;;
    7) Cidade="Rio de Janeiro" ;;
    8) Cidade="São Paulo" ;;
    9) Cidade="Curitiba" ;;
    0) Cidade="Porto Alegre" ;;
esac

echo "A sede fica em $Cidade "


# Resposta do Prof:

#!/bin/bash
#  Informa se o CPF está correto e em
#+ qual região fiscal elefoi emitido

function Calcula
{
    declare -i Prod=0 Soma=0 Ind             # Criando variáveis do tipo inteiro
    local Pesos=123456789
    ((${#1} == 10)) && Pesos=0$Pesos         # Acrecenta 0 nos pesos para 2? DV
    for ((Ind=1; Ind<=${#1}; Ind++))
    {
        Prod=${1:$Ind-1:1}*${Pesos:$Ind-1:1} #  Posso fazer operação matemática
        Soma+=Prod                           #+ assim pq foram declarados inteiros
    }
    echo $((Soma % 11 % 10))                 #  Cálculo final de cada DV. O % 10
}                                            #+ é para o caso do 1? resto ser 10
read -p "Informe - CPF: " Cpf
[[ $Cpf =~ ^([0-9]{3}[. ]?){2}[0-9]{3}[\ -]?[0-9]{2}$ ]] || {
    echo CPF inválido >&2
    exit 1
}

Cpf=$(tr -cd '[0-9]\n' <<< $Cpf)             # Limpa CPF, deixando só os números
Corpo=${Cpf:0: -2}                           # Corpo = CPF sem DVs
DVs=${Cpf: -2}                               # DVs = os dois DVs
Regiao=${Corpo: -1}                          # Regiao = último algarismo do corpo 
DV1=$(Calcula $Corpo)                        # Armazena saída da função em DV1
Corpo+=$DV1                                  # Incrementa o corpo com o 1? DV
DV2=$(Calcula $Corpo)                        # Armazena o 2? DV en DV2
DVCalc=$DV1$DV2
((DVCalc != DVs)) && {
    echo CPF errado, o DV calculado é $DVCalc
    exit 1
}

echo -n "Esse CPF é da ${Regiao}ª Região cuja sede é em "
case $Regiao in
    1) echo Brasília ;;
    2) echo Belém ;;
    3) echo Fortaleza ;;
    4) echo Recife ;;
    5) echo Salvador ;;
    6) echo Belo Horizonte ;;
    7) echo Rio de Janeiro ;;
    8) echo São Paulo ;;
    9) echo Curitiba ;;
    0) echo Porto Alegre ;;
esac
