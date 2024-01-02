#!/bin/bash

#read -n5 -p"CEP: " Num ; read -n3 -p- Compl

: << Enunciado1
1. Supondo que seu script receba um CEP como parâmetro ($1), qual é a melhor forma de saber 
se ele foi informado com a máscara certa, isto é, NN.NNN-NNN, sendo que o ponto separador 
de milhar e o hífen podem ser usados ou não.

Comandos válidos: Vamos resolver isso com somente um comando test e um comando 
echo para dar a resposta. 
Enunciado1
# Resposta:
[[ $1 =~ ^[0-9]{2}.?[0-9]{3}-?[0-9]{3}$ ]] && echo CEP ok || echo CEP não ok

: << Enunciado2
2. Uma função comporta-se exatamente como um programa, isto é, recebe como parâmetros $N 
onde N pode ser qualquer número. A quantidade de parâmetros recebido está na variável $# 
e conjunto de todos os parâmetros passados está em $* e $@. Além disso uma função pode gerar 
um $? de acordo com o seu término (bem sucedido ou não).

Mas existem duas pequenas diferenças, do programa principal:

Uma delas é a que permite que existam essas variáveis citadas com valores independentes das que 
têm mesmo nome no programa principal e são suas homônimas;
A outra é que pode-se passar um código de retorno encerrando a função mas sem encerrar o programa.

Quais são facilidades responsáveis por esses dois casos, a saber:

O que devo fazer para que duas variáveis distintas tenham o mesmo nome (homônimas) mas com 
valores diferentes (um dentro da função e outro no corpo do programa)?
Como se encerra uma função passando um código de retorno, sem abortar o programa?
Enunciado2
# Respostas:
# R1: usar a diretiva local identificando como tal a variável declarada no interior da função 
# R2: usando o comando return no corpo da função, passando como parâmetro o código de retorno

: << Enunciado3
3. No script scr1.sh quero usar a função Funcao que está no arquivo funcoes.func. 
Escreva as duas linhas de código necessárias para fazer isso.
Enunciado3
# Resposta:
source funcoes.func # ou . funcoes.sh (para "importar" o arquivo de funções)
Funcao				# para utilizar a função propriamente dita

: << Enunciado4
 4. Escreva uma função para receber um número e sua base de numeração e convertê-lo para a base 
 decimal.

Observação 1: Para facilitar a sua vida imagine que em todas as bases, os algarismos são 
somente de 0 a 9, porém se você quiser incrementar e usar também letras (por exemplo base 16 
indo de 0 a f), dou a maior força. 
Quanto maior for o desafio que você se colocar, mais você aprende.

Observação 2: Essa função deverá ser feita num loop que multiplica cada algarismo do número 
pela sua base de numeração elevada ao seu peso. O algarismo das unidades tem peso zero, 
o das dezenas tem peso um, o das centenas o peso é dois e assim sucessivamente.

Vamos ver a operação necessária para converter para decimal o número 1032 na base 11:

 3210 ← Pesos
 ↓↓↓↓
(1032)11 = 1x113 + 0x112 + 3x111 + 2x110 = 1331+0+33+2 = 1366
Enunciado4
# Resposta:
#!/bin/bash
function convertebase
{
	Base=$2
	Tamanho=${#1}
	Resultado=0
	for ((i=0;i<$Tamanho;i++))
	{
		Expoente=$(((Tamanho-1)-$i))
		Digito=${1:i:1}
		case $Digito in
			[01])	(($Base == 2)) || 						{
																echo "Base inválida"
																exit 1
															};;
			[2])	(($Base >= 3)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[3])	(($Base >= 4)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[4])	(($Base >= 5)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[5])	(($Base >= 6)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[6])	(($Base >= 7)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[7])	(($Base >= 8)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[8])	(($Base >= 9)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[9])	(($Base >= 10)) ||						{
																echo "Base inválida"
																exit 1
															};;
			[Aa])	((11 <= $Base <= 16)) && Digito=10 ||	{
																echo "Base inválida"
																exit 1
															};;
			[Bb])	((12 <= $Base <= 16)) && Digito=11 ||	{
																echo "Base inválida"
																exit 1
															};;
			[Cc])	((13 <= $Base <= 16)) && Digito=12 ||	{
																echo "Base inválida"
																exit 1
															};;
			[Dd])	((14 <= $Base <= 16)) && Digito=13 ||	{
																echo "Base inválida"
																exit 1
															};;
			[Ee])	((15 <= $Base <= 16)) && Digito=14 ||	{
																echo "Base inválida"
																exit 1
															};;
			[Ff])	(($Base == 16)) && Digito=15 ||			{
																echo "Base inválida"
																exit 1
															};;
			*) 
		esac
		Valor=$(( $Digito * ($Base**$Expoente) ))
		Resultado=$((Resultado+Valor))
	}

	echo $Resultado
}