#!/bin/bash

Target=/home/gustavo/Imagens/
#IFS=$'\n'
for f in `ls $Target`
do
	echo $f
done