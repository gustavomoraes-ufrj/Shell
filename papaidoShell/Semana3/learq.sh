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
