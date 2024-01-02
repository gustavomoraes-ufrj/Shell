#!/bin/bash

Texto=$*
TamTexto=${#Texto}

for ((i=$TamTexto-1;i>=0;i--))
{
	echo -en "${Texto:$i:1}"
}

