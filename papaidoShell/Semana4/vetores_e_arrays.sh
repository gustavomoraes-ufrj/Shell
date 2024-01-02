# Existem 4 formas de se declarar um vetor:

vet=(EL0 EL1 ... ELn)

# Cria o vetor vet, inicializando-o com os elementos EL1, EL2, ... ELn. Se for usado como vet=(),
# o vetor vet será inicializado vazio.

# Declarando-se desta forma, se vet já existir, perderá todos os antigos valores, 
# recebendo os novos.

vet[N]=VAL

# Cria o elemento índice N do vetor vet com o valor VAL. Se não existir, o vetor vet será criado.

declare -a vet

# Cria o vetor vet vazio. Caso vet já exista, se manterá inalterado.

declare -A vet

# Cria um vetor associativo (aquele cujos índices não são numéricos). Essa é a única forma de 
# declarar um vetor associativo, que só é suportado a partir da versão 4.0 do Bash. 

Familia[10]=Silvina
Familia[22]=Juliana
Familia[40]=Paula
Familia[51]=Julio
echo ${Familia[22]}
# Juliana
echo ${Familia[18]}  # Não existe
echo ${Familia[40]}
# Paula

Frutas=(abacaxi banana laranja tangerina)
echo ${Frutas[1]}
# banana

Veiculos=([2]=jegue [5]=cavalo [9]=patinete)
#ATENÇÃO!
# Caso esse vetor já possuísse outros elementos definidos, os valores e os índices antigos seriam
# perdidos e após a atribuição só restariam os elementos recém criados


 # Não mostrei isso no comando read, mas a sua opção -a lê direto para dentro de um vetor. 
 # Vejamos como isso funciona:

read -a Animais <<< "cachorro gato cavalo"	# Usando Here Strings 

for i in 0 1 2
do
 echo ${Animais[$i]}
done

# cachorro
# gato
# cavalo

# $ cat nums
# 1 2 3
# 2 4 6
# 3 6 9
# 4 8 12
# 5 10 15

while read -a vet
do
    echo -e ${vet[0]}:${vet[1]}:${vet[2]}
done < nums

# 1:2:3
# 2:4:6
# 3:6:9
# 4:8:12
# 5:10:15

# Vamos voltar às frutas e acrescentar ao vetor a fruta do conde e a ­fruta pão:

Frutas[4]="fruta do conde"
Frutas[5]="fruta pão"

# Para listar essas duas inclusões que acabamos de fazer em Frutas, repare que usarei expressões
# aritméticas sem problema algum:

echo ${Frutas[10-6]}
# fruta do conde
echo ${Frutas[10/2]}
# fruta pão
echo ${Frutas[2*2]}
# fruta do conde
echo ${Frutas[0*3]}
# abacaxi


echo ${Frutas[*]}
# abacaxi banana laranja tangerina fruta do conde fruta pão

# ou:

echo ${Frutas[@]}
# abacaxi banana laranja tangerina fruta do conde fruta pão
# Melhor forma de fazer a iteração do vetor:
for fruta in "${Frutas[@]}"
do
   echo $fruta
done
# abacaxi
# banana
# laranja
# tangerina
# fruta do conde
# fruta pão

# Para obtermos a quantidade de elementos de um vetor, ainda semelhantemente 
# à passagem de parâmetros, fazemos:

echo ${#Frutas[*]}
# 6
#ou
echo ${#Frutas[@]}
# 6

# se especificarmos o índice, essa expressão devolverá a quantidade de caracteres 
# daquele determinado elemento do vetor.

echo ${Frutas[1]}
# banana
echo ${#Frutas[1]}
# 6

Vetor="${Frutas[@]}"
echo "${Vetor[4]}"
echo "$Vetor"
# abacaxi banana laranja tangerina fruta do conde fruta pão

# O que aconteceu nesse caso foi que eu criei uma variável chamada ­$Vetor com o conteúdo de 
# todos os elementos do vetor Frutas. Como sob o Bash eu posso definir um array colocando os 
# valores de seus elementos entre parênteses, deveria então ter feito:

Vetor=("${Frutas[@]}")
echo "${Vetor[4]}"
# fruta do conde
echo "${Vetor[5]}"
# fruta pão

Animais=([2]="Mico Leão" [5]="Galinha d'Angola" [8]="Gato Pardo")
echo ${!Animais[*]}
echo ${!Animais[@]}
# Saídas iguais

for Ind in ${!Animais[@]}	# Ind recebe cada um dos índices
do
	echo ${Animais[Ind]}
done

# Mico Leão
# Galinha d'Angola
# Gato Pardo

echo ${!Veiculos[@]}	# Só para relembrar os índices de Veiculos
# 2 5 9
echo ${#Veiculos[*]}
# 3
echo ${#Veiculos[@]}
# 3



# Você se lembra que a substituição de processos que usa dois pontos (:) serve para especificar
# uma zona de corte em uma variável. Vamos relembrar:

var=1234567890
echo ${var:1:3}       # O número 1 significa 2º caractere. Origem zero, não esqueça
# 234
echo ${var:4}         # A partir do 5º caractere até o fim
# 567890

# Em vetores, o seu comportamento é similar, porém agem sobre os seus elementos e não sobre seus
# caracteres como em variáveis, vide o exemplo anterior. Vamos exemplificar para entender:

echo ${Frutas[@]:1:3}   # A partir do 2º elemento, listar 3 elementos
# banana laranja tangerina
echo ${Frutas[@]:4}     # A partir do 5º caractere até o fim
# fruta do conde fruta pão

# Se fosse especificado um elemento, este seria visto como uma variável.

echo ${Frutas[0]:1:4}
# baca

Frase=(Alshançar o shéu é sensashional. Um sushesso\!)
echo ${Frase[*]//sh/c}
# Alcançar o céu é sensacional. Um sucesso!

declare -A Animais	# Obrigatório para vetor associativo
Animais[cavalo]=doméstico
Animais[zebra]=selvagem
Animais[gato]=doméstico
Animais[tigre]=selvagem



# Usando Mapfile
# cat frutas
# abacate
# maçã
# morango
# pera
# tangerina
# uva

mapfile vet < frutas  # Mandando frutas para vetor vet
echo ${vet[@]}        # Listando todos elementos de vet
# abacate maçã morango pera tangerina uva

# Obteríamos resultado idêntico se fizéssemos:

vet=($(cat frutas))

# Porém, isso seria mais lento, porque a substituição de comando é executada em um subshell.



