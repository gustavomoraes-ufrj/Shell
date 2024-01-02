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

