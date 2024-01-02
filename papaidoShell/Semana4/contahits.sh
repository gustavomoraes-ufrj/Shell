#!/bin/bash
PIPE="/tmp/pipe_contador" # arquivo named pipe
# dir onde serao colocados os arquivos contadores de cada pagina
DIR="/var/www/contador"

[ -p "$PIPE" ] || mkfifo "$PIPE"

while :
do
    for URL in $(cat < $PIPE)
    do
        FILE="$DIR/$(echo $URL | sed 's,.*/,,')"
        # OBS1: no sed acima, como precisava procurar
        #       uma barra,usamos vírgula como separador.
        # OBS2: quando rodar como daemon comente a proxima linha
        echo "arquivo = $FILE"

        n="$(cat $FILE 2> /dev/null)" || n=0
        echo $((n=n+1)) > "$FILE"
    done
done