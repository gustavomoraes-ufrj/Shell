#!/bin/bash
# Dado um artista, mostra as suas músicas
# versao 3

LinhaMesg=$((`tput lines` - 3))  # Linha que msgs serão dadas para operador
TotCols=$(tput cols)             # Qtd colunas da tela para enquadrar msgs

clear
echo "
                              +----------------------------------------------------+
                              |  Lista Todas as Músicas de um Determinado Artista  |
                              |  ----- ----- -- ------- -- -- ----------- -------  |
                              |                                                    |
                              |  Informe o Artista:                                |
                              +----------------------------------------------------+"
while true
do
    tput cup 5 51; tput ech 31  # ech=Erase chars (31 caracteres para não apagar barra vertical)
    read Nome
    if  [ ! "$Nome" ]           # $Nome estah vazio?
    then
        . pergunta.func "Deseja Sair?" s n
        [ $SN = n ] && continue
        break
    fi

    fgrep -iq "^$Nome~" musicas || # fgrep não interpreta ^ como expressão regular
        {
        . mandamsg.func "Não existe música deste artista"
        continue
        }

    tput cup 7 29; echo '|                                                    |'
 LinAtual=8
    IFS="
:"
    for ArtMus in $(cut -f2 -d^ musicas) # Exclui nome do album
    do
        if  echo "$ArtMus" | grep -iq "^$Nome~"
        then
            tput cup $LinAtual 29
            echo -n '|  '
            echo $ArtMus | cut -f2 -d~
            tput cup $LinAtual 82
            echo '|'
            let LinAtual++
            if  [ $LinAtual -eq $LinhaMesg ]
            then
                . mandamsg.func "Tecle Algo para Continuar..."
                tput cup 7 0; tput ed  # Apaga a tela a partir da linha 7
                tput cup 7 29; echo '|                                                    |'
                LinAtual=8   ========================================
            fi
        fi
    done
    tput cup $LinAtual 29; echo '|                                                    |'
    tput cup $((++LinAtual)) 29
    read -n1 -p "+-----------Tecle Algo para Nova Consulta------------+"
    tput cup 7 0; tput ed              # Apaga a tela a partir da linha 7
done