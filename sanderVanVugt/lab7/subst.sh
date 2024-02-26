#!/bin/bash

for i in *.txt
do
	mv $i ${i%.*}
done
