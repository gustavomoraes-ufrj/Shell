#!/bin/bash

#todo: build a solution to detect main binary from package in case package name doesnt match the service name 
if [ -z $1 ]
then
	echo provide an argument
	exit 3
fi

if [ $MEMFREE -lt 256 ]
then
	echo insufficient memory
	exit 4
fi



sudo echo apt install -y $@
 
for s in "$@"
do
	sudo echo systemctl enable --now $s
done
