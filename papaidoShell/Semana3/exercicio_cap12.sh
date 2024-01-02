#  — Eu acho que a esta altura você deve estar curioso para ver o programa que restaura o arquivo 
#  removido, não é? Pois então aí vai um desafio: faça-o e vamos discuti-lo na nossa próxima aula.

# — Cara, este programa é como tudo que se faz em Shell, extremamente fácil, é para ser feito em, 
# no máximo 10 linhas. Não se esqueça que o arquivo está salvo em /tmp/$LOGNAME e que a sua última 
# linha é o diretório em que ele residia antes de ser "removido". Também não se esqueça de criticar
#  se foi passado o nome do arquivo a ser removido. 

[[ $# -eq 0 ]] &&	{ 
						echo "Nenhum parâmetro foi fornecido"
						exit 1
				  	}

MeuDir="/tmp/$LOGNAME"

# Usei a lógica contida no erreeme.sh para bolar algo semelhante para recuperarmos 
# mais de um arquivo por chamada 

Erro=0                 
for Arq                
do
    if  [ ! -f $MeuDir/$Arq ]  
    then
       echo $Arq nao existe na lixeira.
       Erro=3
       continue       
    fi

    DirOrig=`tail -1 $MeuDir/$Arq` 
    if  [ ! -w $DirOrig ]  
    then
       echo Sem permissao de escrever no diretorio original de $Arq
       Erro=4
       continue           
    fi

    mv $MeuDir/$Arq   $DirOrig/$Arq
    echo $Arq Restaurado
done