#!/bin/bash
#
# ...
# to test, use /usr/bin/blah

echo "Nome do parametro: $1"
filename=${1##*/}
echo 'filename=${1##*/}'
echo "The name of the file is $filename"
directoryname=${1%/*}
echo 'directoryname=${1%/*}'
echo "the name of the directory is $directoryname"
