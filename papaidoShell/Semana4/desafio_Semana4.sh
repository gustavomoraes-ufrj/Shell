: << Desafio1
Tenho duas variáveis: Var1 e Var2, ambas contendo textos muito longos. Como faço para saber 
a diferença em seus conteúdos?

Comandos válidos: diff e echo 
Desafio1
var1="		assim\n 
			caminha\n 
			a \n
			humanidade"
var2="		assim\n
			caminho\n 
			na \n
			humanidade"

diff <(echo -e $var1) <(echo -e $var2)


: << Desafio2
Veja o conteúdo da variável Nums:

$ echo "$Nums"
10
2
1
4
12

Como eu posso classificar esses números em ordem ascendente (do menor para o maior) sem usar 
pipes (|)?

Comandos válidos: sort e echo 
Desafio2
Nums="10\n2\n1\n4\n12"

sort -n <(echo -e $Nums) # Obs: Aqui eu tive dúvida. Como popular a var Num com os números separados
						# por quebra de linha sem ser desta forma, levando em conta que só podemos
						# utilizar os comandos sort e echo? 
						# Fui obrigado tbm a usar a opção -e do echo para poder formatar o arquivo 
						# antes de mandar p o sort. 

: << Desafio3 
Como faço para listar somente o último parâmetro que meu script recebeu?

Observações:

    Os parâmetros podem conter espaços no seu interior. Por exemplo, na linha:

    $ scr.sh a 'b c' d

O script scr.sh está recebendo 3 parâmetros: a, 'b c' e d

    Isso deverá ser feito em uma única linha, sem pipe (|). 
Desafio3

echo ${!#}