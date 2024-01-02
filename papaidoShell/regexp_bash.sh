[[ 'Bash' =~ B[a-z]{3} ]] && echo Casou

[[ 'Bash' =~ "B[a-z]{3}" ]] && echo Casou || echo Não Casou

# Melhor prática: armazenar a regexp em uma variável

regex='B [a-z]{3}'
[[ 'B ash' =~ "$regex" ]] && echo Casou || echo Não Casou   # Assim não casa

regex='B [a-z]{3}'
[[ 'B ash' =~ $regex ]] && echo Casou || echo Não Casou		# Assim casa


[[ 'Bash' =~ ^b ]] && echo Casou || echo Não Casou

shopt -s nocasematch

[[ 'Bash' =~ ^b ]] && echo Casou || echo Não Casou

shopt -u nocasematch


# Utilizando a variável BASH_REMATCH

[[ 'Bash' =~ ^. ]] && echo $BASH_REMATCH
[[ 'Bash' =~ ^... ]] && echo $BASH_REMATCH
[[ 'Bash' =~ ^X ]] && echo $BASH_REMATCH

[[ 'Bash' =~ ^(.)(.)(.)(.) ]] && echo ${BASH_REMATCH[0]}
[[ 'Bash' =~ ^(.)(.)(.)(.) ]] && echo ${BASH_REMATCH[1]}
[[ 'Bash' =~ ^(.)(.)(.)(.) ]] && echo ${BASH_REMATCH[2]}
[[ 'Bash' =~ ^(.)(.)(.)(.) ]] && echo ${BASH_REMATCH[3]}
[[ 'Bash' =~ ^(.)(.)(.)(.) ]] && echo ${BASH_REMATCH[4]}
