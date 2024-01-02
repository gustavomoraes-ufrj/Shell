# Eval

var1=3
var2=var1
eval echo $`echo $var2`
# 3

# ou

eval echo \$$var2


var2='ls $var1'
var1='l*'
$var2
# ls: $var1: No such file or directory
eval $var2
# listamusica    listartista  listartista3  logado logaute.sh


# Exemplo de FTP com tratamento TRAP:

# trap "rm -f /tmp/$$ ; exit" 0 1 2 3 15
# ou
# trap "rm -f /tmp/$$" 0
# trap "exit" 1 2 3 15

# ftp -ivn $RemoComp << FimFTP >> /tmp/$$ 2>> /tmp/$$
#     user $Fulano $Segredo
#     binary
#     get $Arq
# FimFTP



# Named Pipes
# Compara arquivos em dois diretórios diferentes
cmp <(cat dir/*) <(cat dir.bkp/*) >/dev/null || echo backup furado 
cmp <(ls -l dir) <(ls -l dir.bkp) >/dev/null || echo backup furado

# gera uma listagem dos meus arquivos, numerando-os e ao final dar o total de arquivos do 
# diretório corrente:

while read arq
do
    ((i++)) # assim nao eh necessario inicializar i
    echo "$i: $arq"
done < <(ls)
echo "No diretorio corrente (`pwd`) existem $i arquivos"

# Ou

# Porém no segundo caso o valor da variável "i" se perde após o fim do subshell gerado pelo pipe
ls | while read arq
    do
        ((i++)) # assim nao eh necessario inicializar i
        echo "$i: $arq"
    done
    echo "No diretorio corrente (`pwd`) existem $i arquivos"

# O script abaixo prova o mesmo conceito acima
LIST=""                  # Criada no shell principal
ls | while read FILE     # Inicio do subshell
do
    LIST="$FILE $LIST"   # Alterada dentro do subshell
done                     # Fim do subshell
echo :$LIST:

# apresenta o comando ls numerado
cat -n <(ls) 
# Ou 
ls | cat -n -
