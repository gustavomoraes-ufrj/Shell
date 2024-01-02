#!/bin/bash

# [[ ! -d $1 ]] && mkdir $1
# [[ -d $1 ]] || mkdir $1

cd $1 2>&- || {
	mkdir $1
	cd $1
}
pwd

