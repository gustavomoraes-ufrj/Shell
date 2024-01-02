#!/bin/bash
#  Recebe um horário como parâmetro e confere para ver
#+ se é um horário válido e está no formato HH:MM.

if  [[ $1 =~ ^([01][0-9]|2[0-3]):([0-5][0-9])$ ]]
then
    echo Horário aceito
else
    echo Horário inválido
fi

 echo $BASH_REMATCH
 echo ${BASH_REMATCH[@]}

 # Obs: pq no exemplo fornecido foi utilizado o ${BASH_REMATCH[@]} 
 # ao invés de apenas o $BASH_REMATCH