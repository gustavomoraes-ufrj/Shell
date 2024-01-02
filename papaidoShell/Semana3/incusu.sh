#!/bin/bash
# Versão 1
if  grep -q ^$1 /etc/passwd 2>&-
then
    echo Usuario \'$1\' já existe
else
    if  useradd $1 2>&- # ou 2> /dev/null
    then
        echo Usuário \'$1\' incluído em /etc/passwd
    else
        echo "Problemas no cadastramento. Você é root?"
    fi
fi