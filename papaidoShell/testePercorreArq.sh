

# while read Arq
# do 
# 	echo -e $Arq
# done < <(cat Musicas)


IFS=$'\n'
for Arq in $(cat seu_arquivo.txt)
{
	echo -e $Arq
}

