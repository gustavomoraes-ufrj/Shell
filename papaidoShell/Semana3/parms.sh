#!/bin/bash
[[ $# -eq 0 ]] &&	{
						echo "Nenhum parâmetro fornecido"
						exit 1
					}

for parms
do
	echo $((++i)) $parms
done
