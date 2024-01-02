: << Exercício3 
Como você listaria somente o último parâmetro recebido por um script? (Existem 3 
# formas de fazer isso, mas uma delas parece certa mas não é, dá erro se um dos parâmetros 
# passados tiver um espaço em branco). 
Exercício3

# Minha resposta:
eval echo \$$(($#))

#Respostas do prof:
echo ${!#}

#ou

shift $(($#-1))
echo $1

: << Exercício4 
Veja isso:

$ echo ${Animais[@]}
Mico Leão
Galinha d'Angola
Gato Pardo

Como eu posso listar os índices de cada um dos elementos do vetor. 
Exercício4
# Minha resposta:
Animais=([2]="Mico Leão" [5]="Galinha d'Angola" [8]="Gato Pardo")
for Ind in ${!Animais[@]}	# Ind recebe cada um dos índices
do
	echo $Ind:${Animais[Ind]}
done

# Resposta do prof:
echo ${!Animais[@]}

: <<  Exercício5
Olha essas linhas que peguei no prompt:

$ Redir=\>
$ echo xxx $Redir lixo
xxx > lixo
$ cat lixo
$

Ora, se a variável $Redir tinha um caractere de redirecionamento (>) porque o Shell jogou a 
saída do echo para a tela e não redirecionou-a para o arquivo lixo? O que devo fazer para que 
isso ocorra? 
Exercício5

# Minha Resposta:
 Redir=\>
 eval echo xxx $Redir lixo
 cat lixo

# Resposta do prof:
 Redir=\>
 eval echo xxx $Redir lixo
 cat lixo
 
: <<  Exercício6 
Qual será a saída desta linha de comandos?
Exercício6

cat <(seq 5 | tr '\n' ' ') 

# Minha Resposta: Letra D - 1 2 3 4 5

# Resposta do prof: Melhor implementação
cat <(seq -s ' ' 5) 


: << Exercício7
Escrever um script chamado listarq.sh para listar o tamanho e o nome de todos os arquivos do 
diretório raíz e ao final, dar o total de arquivos lidos (observação: extrair os dados de um 
ls -l, mas use um tail -n +2 para matar a 1ª linha (de total) e não pode usar o comando wc)
Exercício7
# Minha Resposta:
while read Arq
do 
	((i++))
	echo -e $Arq
done < <(ls -l / | tail -n +2 | tr -s ' ' |cut -d' ' -f5,9 --output-delimiter '=====')

echo Total de $i arquivos

# Resposta do prof:
Lidos=
while read lixo lixo lixo lixo Tam lixo lixo lixo Nome
do
    let Lidos++
    echo -e "$Lidos\t$Tam\t$Nome"
done < <(ls -l / | tail -n +2 | tr -s ' ')
echo -e "\n\nForam listados $Lidos arquivos"


: << Exercício8
 Observe:

$ seq 2 2 6 > par
$ seq 1 2 5 > impar
$ paste impar par
1	2
3	4
5	6

$ Par=$(seq 2 2 6)
$ Impar=$(seq 1 2 5)
$ paste "$Impar" "$Par"
paste: '1'$'\n''3'$'\n''5': Arquivo ou diretório não encontrado

Como você viu, enquanto os valores estavam em 2 arquivos, consegui listá-los lado a lado com o 
comando paste. Se os mesmos dados estão dentro de duas variáveis o paste dá erro, já que ele 
requer como entrada 2 ou mais arquivos e após a substituição de variáveis o que ele viu foram 
os números que estavam na variável.

O que devo fazer para colocar os dados das variáveis lado a lado? (Observação: não esqueça das 
aspas, senão os <ENTER> viram espaços em branco) 
Exercício8
# Minha Resposta:
Par=$(seq 2 2 6)
Impar=$(seq 1 2 5)
paste <(echo "$Impar") <(echo "$Par")

# Resposta do prof:
paste <(echo "$Impar") <(echo "$Par")

