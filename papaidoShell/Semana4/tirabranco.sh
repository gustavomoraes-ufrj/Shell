#!/bin/bash
#  Renomeia arquivos com espaços nem branco
#+ no nome, trocando-os por sublinhado (_).
Erro=0
for Arq in *' '*      # Expande para todos os arquivos com espaço em branco no nome
do
[ -f ${Arq// /_} ] && {
    echo $Arq não foi renomeado
    Erro=1
    continue
    }
mv "$Arq" "${Arq// /_}"
done 2> /dev/null     #  Caso não exista arquivo com brancos o for dá erro
exit $Erro

# Um macete muito interessante: no exemplo que acabamos de ver, se quiséssemos testar se 
# existiam arquivos com espaços no nome e fizéssemos:

# [[ -f *' '* ]] ou [ -f *' '* ]

# E se existisse mais de um arquivo que atendesse a esta característica, você ganharia um erro
# porque o comando test -f é unário, isto é, ele só verifica a existencia de um único arquivo.
# Para contornar isso, poderíamos fazer:

ls *' '* > /dev/null 2> /dev/null || echo Não há arquivo com espaço no nome.

