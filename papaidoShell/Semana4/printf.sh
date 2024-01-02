 printf "%c" "1 caracter"
# 1$               # Errado! Só listou 1 caractere e não saltou linha ao final
 printf "%c\n" "1 caracter"
# 1                # Saltou linha mas ainda não listou a cadeia inteira
 printf "%c caractere\n" 1
# 1 caractere      # Esta é a forma correta o %c recebeu o 1
 a=2
 printf "%c caracteres\n" $a
# 2 caracteres     # O %c recebeu o valor da variável $a
 printf "%10c caracteres\n" $a
# 2 caracteres
 printf "%10c\n" $a caracteres


printf "%d\n" 32
# 32
printf "%10d\n" 32
# 32              # Preenche com 8 brancos à esquerda e não com zeros
printf "%04d\n" 32
# 0032                    # 04 após % significa 4 dígitos com zeros à esquerda
printf "%e\n" $(echo "scale=2 ; 100/6" | bc)
# 1.666000e+01            # O default do %e é 6 decimais
printf "%.2e\n" `echo "scale=2 ; 100/6" | bc`
# 1.67e+01                # O .2 especificou duas decimais
printf "%f\n" 32.3
# 32.300000               # O default do %f é 6 decimais
printf "%.2f\n" 32.3
# 32.30                   # O .2 especificou duas decimais
printf "%.3f\n" `echo "scale=2 ; 100/6" | bc`
# 33.330                  # O bc devolveu 2 decimais. o printf colocou 0 à direita

printf "%e\n" $(echo "scale=2 ; 100/6" | bc)    
# bash: printf: 16.66: número inválido    
# 0,000000e+00    
LC_ALL=C printf "%e\n" $(echo "scale=2 ; 100/6" | bc)    
# 1.666000e+01    


printf "%o\n" 10
# 12                      # Converteu o 10 para octal
printf "%03o\n" 27
# 033                     # Assim a conversão fica com mais jeito de octal, né?
printf "%s\n" Peteleca
# Peteleca
printf "%15s\n" Peteleca
# Peteleca         # Peteleca + brancos à esquerda com total de 15 caracteres    
printf "%-15sNeves\n" Peteleca
# Peteleca       Neves    # O menos (-) encheu com brancos à direita de Peteleca
printf "%.3s\n" Peteleca
# Pet                     # 3 trunca as 3 primeiras
printf "%10.3sa\n" Peteleca

#       Peta             # Pet com 10 caracteres concatenado com a (após o s)

printf "EXEMPLO %x\n" 45232
# EXEMPLO b0b0            # Transformou para hexa mas os zeros não combinam
printf "EXEMPLO %X\n" 45232
# EXEMPLO B0B0            # Assim disfarçou melhor (repare o X maiúsculo)
printf "%X %XL%X\n" 49354 192 10
# C0CA C0LA

printf "%20s" | tr ' ' -   # Não saltei linha (\n), então prompt sairá colado
# --------------------$

printf "%$(tput cols)s" ' ' | tr ' ' -
# ------------------------------------------------------------------------------------

printf  "\e(0\x71\e(B"
# ¯

printf -v traco "\e(0\x71\e(B"
echo $traco
# ¯

printf "%$(tput cols)s" ' ' | tr ' ' $traco 

printf "%$(tput cols)s" ' ' | sed "s/ /$traco/g"

printf "%$(tput cols)s" ' ' | sed "s/ /$(printf '\e(0\x71\e(B')/g" 



