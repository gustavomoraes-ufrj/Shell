#!/bin/bash

DISK=$(df -m | grep '/$' | awk '{ print $4 }')
MEM=$(free -m | grep -i mem: | awk '{ print $4 }')

# check if DISK and MEM are low
if [ $DISK -le $(( 1024 * 3 )) ] && [ $MEM -le 512 ]
then
	echo WARNING: low system resources
	exit 9
fi

# check if only disk is low
if [ $DISK -le $(( 1024 * 3 )) ]
then
	echo WARNING: low free disk space
	exit 8
fi


# check if only mem is low
if [ $MEM -le 512 ]
then
	echo WARNING: low memory available
	exit 7
fi

# print message if all is good

echo Your system is running fine

