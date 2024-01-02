# Exerc 1
# 	Dado um nome (tipo Décio Machado Nogaio), faça uma Expressão Regular 
#	que case somente o primeiro nome (Décio); 
texto="Décio Machado Nogaio"
regexp='^[[:alpha:]]+\>'

grep -oE $regexp <<< $texto

regexp='^\w*\b'

grep -oE $regexp <<< $texto


echo Muito bom!!!


# Exerc 2
#	Dado um nome (tipo Frei Ada Brusque), faça uma Expressão Regular 
#	que case somente o último nome (Brusque); 

texto="Frei Ada Brusque"
regexp='[[:alpha:]]+$'

grep -oE $regexp <<< $texto

regexp='\w+$'

grep -oE $regexp <<< $texto


echo 'Excelente, mas sempre procuro não encorajar o uso desses caracteres escpados com o \w que vc usou. São mais simples e funcionam, porém por não serem do repertório POSIX, não são todos os ambientes que os suportam.'


# Exerc 3
#	Verificar uma data, para ver se o dia está entre 01 e 31, 
#	o mês entre 01 e 12 e ano entre 2000 e 3000; 

texto="o dia 05/04/2000 foi a data do meu aniversario"
regexprof='(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/2[0-9]{3}'  #OBS

echo $texto | egrep  -o $regexp

echo 'Ainda nem li a tua OBS, mas há uns 2 dias pedi ao Rubens para trocar 3000 por 2999 e se vc não puser bordas dá zebra. Para vc ver, tire o -o e teste com:'
texto="o dia 1234505/04/200010 foi a data do meu aniversario"
regexp='(0[1-9]|[12][0-9]|3[01])[/-](0[1-9]|1[0-2])[/-](2[0-9]{3}|3000)'
egrep  -o $regexp <<< "$texto"

echo 'Prefira grep -E a egrep. Além de não ser POSIX, em um monte de distro é um alias (ou link) para um script que chama o grep -e $@'



# Exerc 4
#	Como o anterior, mas com o dia e o mês podendo ser precedidos ou não por um zero,
#	isto é, um dia pode ser 02 ou simplesmente 2 e mês idem; 

texto="o dia 05/04/2000 foi a data do meu aniversario"
regexp='(0?[1-9]|[12][0-9]|3[01])[/-](0?[1-9]|1[0-2])[/-](2[0-9]{3}|3000)'
regexprof='(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[0-2])/2[0-9]{3}' #OBS

echo $texto | egrep  -o $regexp
echo Mesmas observações

# Exerc 5
#	Verificar se um horário está compreendido entre 00:00 e 23:59; 

texto="23:58"
regexp='([01][0-9]|2[0-3]):([0-5][0-9])'

echo $texto | egrep  -o $regexp

texto="23:58"
regexp='([01][0-9]|2[0-3]):([0-5][0-9])'

echo $texto | egrep  -o $regexp

Sem borda dá zebra...


# Exerc 6
#	Verificar se um valor monetário foi informado de forma correta, 
#	com vírgula separando decimais e ponto separando milhares 

    texto='1.000.342.322.910,93'
regexp='^[1-9]{1,3}(\.[0-9]{3})*,[0-9]{2}$' 
regexprof='^[0-9]{1,3}(\.[0-9]{3})*,[0-9]{2}$'  #OBS

echo $texto | egrep  -o $regexp
echo $texto | egrep  -o $regexprof

echo 'Considero esse o seu 1o. erro. Os outros foram falta de tarimba, ninguém lembra de bordas... 
Mas nessa sua er, vc pensou em rirar o zero do início e tirou geral... Faça um teste:'
texto=10.123,00

# Exerc 7
#	7. Verificar se um endereço de e-mail atende às especificações a seguir: 

    # USUARIO@DOMINIO[.CATEGORIA][.PAIS]
    # USUARIO - Só pode ter letras, números, ponto (.), sublinha (_) e traço (-), 
    # terminando com uma arroba (@);
    # DOMINIO - Só pode ter letras minúsculas, números e traço (-) com tamanho mínimo de 2 e 
    # máximo de 26 caracteres;
    # CATEGORIA (opcional) - Aceitas .com, .gov, .org, .net, .edu ou nenhuma (como em ufrj.br);
    # PAIS (opcional) - Duas letras minúsculas.

texto='gustavomoraes.ufrj@brazil.ufrj.ur'
regexp='[A-Za-z0-9_.-]+@[a-z0-9-]{2,26}(\.?[a-z]{2,4})?(\.?[a-z]{2})?' 
regexprof='[A-Za-z0-9._-]+@[a-z0-9-]{2,26}(\.(com|org|net|edu|gov))?(\.[a-z]{2})?'

echo 'Legal, mas eu tinha limitado o escopo da categoria.'

echo $texto | egrep  -o $regexp
echo $texto | egrep  -o $regexprof


 # Exerc 8 
 #	Verificar se um endereço de site atende às especificações, observando as mesmas restrições 
 #	para nome de domínio, categoria e país do exercício anterior. Protocolos válidos: http, https e ftp. O protocolo, bem como o www são opcionais. 

texto='https://www.tre-rj.jus.br'
regexp='^((https|ftp|http)://)?(www\.)?[a-z0-9-]{2,26}(\.?[a-z]{2,4})?(\.?[a-z]{2})?$'
regexprof='^((https?|ftp)://)?(www\.)?[a-z0-9-]{2,26}(\.(com|org|net|edu|gov))?(\.[a-z]{2})?$ '  

echo $texto | egrep  -o $regexp
echo $texto | egrep  -o $regexprof

echo 'eu escrevi https? que casa com https e http

 # Exerc 9 
 #	Verificar se um endereço IP atende às especificações 
 #	(basta ver se cada octeto tem de 1 a 3 algarismos, não precisa ver se está entre 0 e 255)

texto='1.1.1.1'
regexp='\<([0-9]{1,3}\.){3}[0-9]{1,3}\>'
regexprof='\b([0-9]{1,3}\.){3}[0-9]{1,3}\b'  

echo 'Muito bom. Dando aula, vario entre \b e \< + \>, mas só tenho usado os últimos, como vc fez'

echo $texto | egrep  -o $regexp
echo $texto | egrep  -o $regexprof

 #	Exerc 10
 #	Verificar se um endereço de hardware (mac address) atende às especificações, isto é, 
 #	tem o formato hh:hh:hh:hh:hh:hh, onde cada h é um número hexadecimal

texto='ab:cd:ef:01:02:09'
regexp='([a-fA-F0-9]{2}[:.-]){5}[a-fA-F0-9]{2}'

echo $texto | egrep  -o $regexp

regexp='([[:xdigit:]]{2}[:.-]){5}[[:xdigit:]]{2}'

regexprof='\b([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}\b'  

echo $texto | egrep  -o $regexp
echo $texto | egrep  -o $regexprof
