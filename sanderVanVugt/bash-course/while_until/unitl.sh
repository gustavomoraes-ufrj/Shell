#!/bin/bash

until [ -f /tmp/teste.txt ]
do
	echo nada consta
	sleep 3
done

echo tá lá já
