
# Exercício 2: Qual é a pior forma de sabermos se o usuário gustavo está "logado" ou não: 
time who | grep -q gustavo && echo gustavo está logado || echo gustavo não está logado


time if who | grep -q gustavo
  then echo gustavo está logado
  else echo gustavo não está logado
fi


time if [ $(who | grep -c gustavo) != 0 ]
   then echo gustavo está logado
   else echo gustavo não está logado
fi
# R: pior caso da execução do comando time, portanto escolhi como sendo esta a resposta (C).
# Não sei se o método q usei foi correto, mas acabou batendo na resposta certa :)


# Exercício 8: 
# Faça um script chamado parms.sh que, quando executado, numera cada um dos parâmetros recebidos. 
# Digamos que parms.sh receba os parâmetros param-A param-B param-C. 
# E o script tem de produzir o seguinte resultado:

# parms.sh param-A param-B param-C
# 1 param-A
# 2 param-B
# 3 param-C

# Minha Resposta:
[[ $# -eq 0 ]] &&	{
						echo "Nenhum parâmetro fornecido"
						exit 1
					}
for parms
do
	echo $((++i)) $parms
done

#Resposta do prof:
#  Este script numera os parâmetros recebidos

#  Sera que recebi parâmetros?
(($# == 0)) && {   # Se a quantidade de parâmetros ($#) for zero
    echo Preciso de parâmetros para poder viver
    exit 1         # Aborta passando código de retorno ($?) 1
}

for Parm           # Sem o "in" o for pega cada um dos parâmetros passados
do
    echo $((++Conta)) $Parm  #  Repare que $Conta não foi inicializada
                             #+ mas assumiu zero como valor inicial
done


# Exercício 9: Faça um script chamado learq.sh que ficará em loop lendo nomes de arquivos 
# na linha 10 coluna 30. Este programa encerrará somente quando o operador der um <ENTER> 
# sem informar nenhum nome de arquivo. Observação: antes de ler um nome de arquivo, 
# não se esqueça de limpar o nome anterior. 
# Minha resposta:
#!/bin/bash

 while true  
 do
 	clear
	tput cup 10 30 
	read -p "Digite o nome do arquivo: " ARQ
	[[ "$ARQ" ]] ||	{
						echo Valeu!
						exit 1
					}
 done

# Resposta do Prof:
#!/bin/bash
#  Lê nomes de arquivos em loop ? Versão 1

clear
tput cup 10 21            #  Posiciona para pedir nome do arquivo
echo Arquivo:             #  Pede nome do arquivo
while true
do
    tput cup 10 30        #  Posiciona para ler o dado
    tput el               #  Apaga até o fim e mas permanece na posição
    read Arq              #  Lê nome do arquivo
    [[ -z $Arq ]] && exit #  Se variável que deveria ter o nome
                          #+ do arquivo for vazia, termina
done


# Exercício 10: No mesmo script do exercício anterior, verificar se o arquivo existe e, 
# caso contrário dar uma mensagem de erro no centro da antepenúltima linha, isto é, 
# quantidade de linhas menos 3. 
# Minha resposta:
#!/bin/bash

COLS=$(tput cols)          
LINS=$(tput lines)         
PENULTIMA=$(($LINS - 3))    
CENTRO=$((($COLS - 9) / 2)) 

 while true  
 do
 	clear
	tput cup 10 30 
	read -p "Digite o nome do arquivo: " ARQ
	[[ "$ARQ" ]] ||	{
						echo Valeu!
						exit 1
					}
	[[ ! -f $ARQ ]] &&	{
							tput cup $PENULTIMA $CENTRO	
							echo "Arquivo não encontrado" 
							break
						}
 done

# Resposta do Prof:
#!/bin/bash
#  Lê nomes de arquivos em loop - Versão 2
clear
tput cup 10 21              #  Posiciona para pedir nome do arquivo
echo Arquivo:               #  Pede nome do arquivo
while true
do
    tput cup 10 30          #  Posiciona para ler o dado
    tput el                 #  Apaga até o fim mas permanece na posição
    read Arq                #  Lê nome do arquivo
    [[ -z "$Arq" ]] && exit #  Se variável que deveria ter nome
                            #+ do arquivo for vazia, termina
    if  [[ ! -f $Arq ]]     #  Se o arquivo informado não existir...
    then
        TotLin=$(tput lines)        #  Quantidade de linhas
        let Lin=TotLin-3            #  $Lin contém a linha da msg de erro
        # As duas linhas acima, podem ser resumidas como:
        # let Lin=$(tput lines)-3
        Msg=$(echo $Arq não existe) #  O tamanho de $Msg variará
                                    #+ por causa de $Arq
        Tam=${#Msg}                 #  Tamanho da mensagem de erro
        TotCol=$(tput cols)
        let Col=(TotCol-Tam)/2
        tput cup $Lin $Col          #  Posicionei para dar a mensagem
        echo $Msg
        read -n1                    #  Espera tocar em qualquer tecla
        tput cup $Lin $Col          #  Reposiciona no início da mensagem
        tput el                     #  Apaga mensagem
    fi
done


# Exercício 11: Escreva no próprio prompt uma função que você passe dois números e ela te 
# devolva o resultado da divisão do primeiro pelo segundo (quociente inteiro) 
# e o resto desta divisão.
# Minha resposta:
$ function divisao
> {
>     RESULT=$(($1 / $2))
>     RESTO=$(($1 % $2)) 
> echo "O resultado da divisão foi: $RESULT"
>     echo "O resto da divisão foi: $RESTO"
> }
# Obs: fiz no próprio prompt, por isto a apresentação diferente das demais

# Resposta do Prof:
function Divide
{
    echo Quociente = $(($1 / $2))
    echo Resto     = $(($1 % $2))
}


# Exercício 12: Escrever uma função chamada NovesFora que receberá um número de 5 algarismos 
# e calculará os noves fora. Dica: some todos os 5 algarísmos e, só no fim, 
# pegue o resto da divisão por nove. 
# Minha resposta:
#!/bin/bash
function Noves
{
	TAM=${#1}
	SOMA=0
	for ((i=0;i<=$TAM-1;i++))
	{
		NUM=${1:$i:1}
		SOMA=$(($SOMA + $NUM))
	}

	NOVES=$(($SOMA % 9))
	return $NOVES
}

# Resposta do Prof:
function NovesFora
{
    Soma=0
    for ((i=1; i<=5; i++))
    {
        Num=$(cut -c$i <<< $1) # Num recebe cada algarismo do parâmetro
        [[ $Num =~ [0-9] ]] || return 1
        let Soma+=Num
    }
    echo $1 noves fora $((Soma%9))
}

# Exercício 13: screva um script chamado contareg.sh que lê o /etc/passwd, lista o User ID 
# e o User Name (3º e 1º campos) e a cada 10 registros lidos dá uma parada, 
# dando a seguinte mensagem:

# Tecle algo para seguir ou q para terminar ...

# e ao final informe a quantidade de registros lidos. 

# Minha resposta:
#!/bin/bash
clear
while read Num
do
	CONT=$((CONT + 1))
    USERID=$(cut -d: -f3 <<< $Num)
    USERNAME=$(cut -d: -f1 <<< $Num)
	echo $USERID:$USERNAME
    ((CONT % (`tput lines` - 3) == 0)) &&
        {
        read -n1 -p "Tecle algo para seguir ou q para terminar ..." LETRA < /dev/tty 
        [[ $LETRA == q ]] &&	{
        							echo -e "\nbye"
        							break
        						}
        clear                               
        }
done < /etc/passwd

echo "Foram lidos $CONT registros."


# Resposta do Prof:
#!/bin/bash
#  Lê /etc/passwd listando os UIDs e Logins. A cada 10
#+ registroslidos ele para e lê o que será digitado.
#+ Se for um q, termina a execução.
#+ Ao final apresentará o total de registros lidos

Lidos=0; clear                              # Preparando ambiente
while IFS=: read UserName Lixo UserID Lixo  # Mudou o IFS para leitura e
                                  #+ jogou em Lixo o que não interessava
do
    echo -e "$UserID\t$UserName"  #  Com a opção -e, o \t é um 
    ((++Lidos % 10 == 0)) && {    #  Pré incrementou Lidos e testou se o
                                  #+ resto da sua divisão por 10 era zero
        read -n 1 -p "Digite q para terminar ou algo \
para prosseguir... " < /dev/tty
        clear
    }
    [[ $REPLY == [qQ] ]] && break
done < /etc/passwd
echo Total de registros lidos = $Lidos
