#!/bin/bash
# É o seguinte: quero que você faça um programa que receberá como parâmetro o nome de um arquivo e
# que quando executado salvará este arquivo com o nome original seguido de um til (~) e colocará
# este arquivo dentro do vi (o melhor editor que se tem notícia) para ser editado.
# Isso é para ter sempre a última cópia boa deste arquivo caso o cara faça alterações indevidas. 
# Obviamente, você fará as críticas necessárias, como verificar se foi passado um parâmetro, 
# se o arquivo passado existe, ... Enfim, o que te der na telha e você achar que deve constar 
# do script. Deu prá entender? 
#   

NUMPARAM=$#

[[ $NUMPARAM -ne 1 ]] &&  { 
							echo "Número incorreto de parâmetros!" 
							exit 1 
						  }

NOMEARQ=$1

[[ ! -f $NOMEARQ ]] &&  { 	
							vi $NOMEARQ 
							exit 0
						}

cp $NOMEARQ $NOMEARQ~ 

vi $NOMEARQ

exit 0