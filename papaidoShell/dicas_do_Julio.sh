# Como vc viu o Shell funciona mesmo para as coisas que vc não acha que funcionaria 
# e nem precisaria ter inicializado a variável $Cont.
# A sintaxe que vc usou, mostraria a contagem palavra a palavra, se vc usasse let, 
# só mostraria no final.
# Sempre que vc usar um cmd cat, desconfie que existe uma forma melhor de fazer.
# Minhas propostas para o loop:

# # 1- Contando linha a linha:
# for Palavra in $(< $1)
# {
#     echo -e "$((++Cont))\t$Palavra"
# }

# # 2- Só o resultado final:
# for Palavra in $(< $1)
# {
#     let ++Cont
# }
# O arquivo $1 tem $Cont palavras


# Fala Gustavo,
# como vc, assim como o Flamengo, está em outo patamar, serei bem critico com o seu exercício, 
# apesar de achar que ele está quase 100%, exceto por uma bobeada (tenho certeza que foi bobeada, 
# não foi erro).

# Vou colar aqui o seu script e comentar linha a linha.

# NUMPARAM=$#

# [[ $NUMPARAM -ne 1 ]] &&  {
# echo "Número incorreto de parâmetros!"
# exit 1
#  }

# : << Comentario1
# 1 - Como vc só usará o $# na neste local, não acho legal salvar a variável. 
# Prefiro trabalhar direto com o $#;
# 2 - Jamais use variáveis com letras maiúsculas. Dê o cmd env | more para vc ver qtas 
# variáveis o sistema já criou com letras maiúsculas. A chance de vc criar uma variável 
# homônima de uma que já existe é muito grande e difícil de descobrir a origem do erro que 
# irá causar.
# 3 - Se vc usar a matemática do Shell para fazer essa comparação, fica com o desempenho muito 
# melhor. Assim sendo eu trocaria tudo até aqui por um simples:

# (($# != 1)) &&  {
#     echo "Número incorreto de parâmetros!"
#     exit 1
# }
# Comentario1

# NOMEARQ=$1

# [[ ! -f $NOMEARQ ]] &&  {
# vi $NOMEARQ
# exit 0
# }
# : << Comentario2
# Aqui foi a bobeada, vc não está acusando erro se $NomeArq (se habitue a esse tipo de nomenclatura 
# para variáveis) não existir, está editando um cara que não existe. O certo seria:

# [[ -f $NomeArq ]] || {
#     echo $NomeArq não é um arquivo regular ou não existe >$2 
#     exit 1
# }
# Comentario2

# cp $NOMEARQ $NOMEARQ~

# vi $NOMEARQ

# exit 0

# Uma observação final. O cmd : não faz nada e como o here document (<<) diz para o Shell só 
# começar a agir após o label (Comentario[12]), isso é uma forma rápida de criar um bloco de 
# comentários sem necessitar colocar um # antes de cada linha.




