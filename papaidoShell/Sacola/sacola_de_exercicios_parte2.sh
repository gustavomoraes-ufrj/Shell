
: << Exercício6
Vamos criar um programa para que, uma vez informadas as cores de um resistor, o script dirá seu valor em ohms (?)

A quantidade de faixas de um resistor varia de 3 a 6 faixas, mas a grande maioria do que você encontrará será 
de 3 ou 4 faixas, cujas definições são idênticas, porém a 4ª faixa indica a tolerância que o componente tem. 
Os resistores de 3 faixas são considerados como tendo uma 4ª faixa sem cor que representa uma tolerância de ±20%.

O script receberá como parâmetro os nomes de 3 cores, sendo que as duas primeiras definem o valor do resistor 
e a última a potência de 10 que multiplicará o valor obtido pelas duas primeiras, de acordo 
com a tabela a seguir:
Cor 	Dois Primeiros Valores 	Multiplicador
Preto 		0 	100
Marrom 		1 	10¹
Vermelho 	2 	10²
Laranja 	3 	10³
Amarelo 	4 	104
Verde 		5 	105
Azul 		6 	106
Violeta 	7 	107
Cinza 		8 	108
Branco 		9 	109

Observação:

O valor final terá a menor quantidade de zeros possível, isto é:
Errado 			Certo
2000 omhs 		2 kiloomhs
30000000 ohms 	30 megaohms
Exercício6
# Minha resposta:

#!/bin/bash

(($# == 3)) || 	{
					echo Quantidade inválida de parâmetros
					echo "Uso: $0 p1 p2 p3" >&2
					exit 1
				}
Preto=0
Marrom=1
Vermelho=2
Laranja=3
Amarelo=4
Verde=5
Azul=6
Violeta=7
Cinza=8
Branco=9

while [ -n "$1" ]
do
	case $1 in
		[Pp]reto) Resistor=$Resistor$Preto ;;
		[Mm]arrom) Resistor=$Resistor$Marrom ;;
		[Vv]ermelho) Resistor=$Resistor$Vermelho ;;
		[Ll]aranja) Resistor=$Resistor$Laranja ;;
		[Aa]marelo) Resistor=$Resistor$Amarelo ;;
		[Vv]erde) Resistor=$Resistor$Verde ;;
		[Aa]zul) Resistor=$Resistor$Azul ;;
		[Vv]ioleta) Resistor=$Resistor$Violeta ;;
		[Cc]inza) Resistor=$Resistor$Cinza ;;
		[Bb]ranco) Resistor=$Resistor$Branco ;;
		*)	echo Cor desconhecida
			exit 2 ;;
	esac
	shift
done

Exp=${Resistor:2:1}        

Resistor=10#${Resistor:0: -1} 
((Resistor*=10**Exp))
Zeros=${Resistor//[1-9]/}
Unid=${#Zeros}             
((Unid/=3))
((Resistor/=1000**Unid))

case $Unid in
    0) Resistor+=" ohms";;
    1) Resistor+=" kiloohms";;
    2) Resistor+=" megaohms";;
    3) Resistor+=" gigaohms";;
esac

echo $Resistor

# Resposta do Prof:
#!/bin/bash
(( $# == 3 )) || {
    echo "Uso: $0   " >&2
    exit 1
}
declare -c Parm     # Param sempre estará capitalizada
for Parm            # Param assume cada um dos parâmetros passados
do 
    case $Parm in
        Preto)    Resistor+=0;;
        Marrom)   Resistor+=1;;
        Vermelho) Resistor+=2;;
        Laranja)  Resistor+=3;;
        Amarelo)  Resistor+=4;;
        Verde)    Resistor+=5;;
        Azul)     Resistor+=6;;
        Violeta)  Resistor+=7;;
        Cinza)    Resistor+=8;;
        Branco)   Resistor+=9;;
        *) echo Cor inválida >&2
           exit 1;;
    esac
done
Label=${Resistor:2:1}        # Fica a última cor, a que define a potência de 10
Resistor=10#${Resistor:0: -1} # 10# - Indica valor está na base 10
let Resistor*=10**Label
Zeros=${Resistor//[1-9]/}    # Exclui os algarísmos != 0
Unid=${#Zeros}               # Unid recebe a qtd de zeros
let Unid/=3                  # Unid recebe a qtd de grupos de 3 zeros
let Resistor/=1000**Unid     # Tira os grupos de 3 zeros do final
case $Unid in
    0) Resistor+=" ohms";;
    1) Resistor+=" kiloohms";;
    2) Resistor+=" megaohms";;
    3) Resistor+=" gigaohms";;
esac
echo $Resistor



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
