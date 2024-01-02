#!/bin/bash

cad1=1
cad2=01
if  test $cad1 = $cad2
then
   echo As variáveis são iguais.
else
   echo As variáveis são diferentes.
fi


echo -e "\nTeste 2\n"

cad1=1
cad2=01
if  test $cad1 -eq $cad2
then
   echo As variáveis são iguais.
else
   echo As variáveis são diferentes.
fi

echo -e "\nTeste 3\n"

H=12

[[ $H == [0-9] || $H == 1[0-2] ]] || echo Hora inválida


echo -e "\nTeste 4\n"

Cargo=Senador
[[ $Cargo =~ ^(Governa|Sena|Verea)dora?$ ]] && echo Tá na Lava Jato?

echo -e "\nTeste 5\n"


Num=5
((Num + 3 == 8)) && echo Certo!!!!    # Duvida AQUI: pq funciona com Num (e não $Num) aqui? 
(($Num + 3 == 8)) && echo Certíssimo!!!!

echo -e "\nTeste 6\n"

((Num = 8 + 3)) && echo "Valor final de \"\$Num\" é $Num"

