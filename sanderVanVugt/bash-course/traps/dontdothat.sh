#!/bin/bash
int_count=0

function no_int()
{
	let int_count++
	echo
	if [[ $int_count == 1 ]]; then
		echo Don\'t do that.
	elif [[ $int_count == 2 ]]; then
		echo if you\'re sure, do it once more.
	else
		echo "Okay, bye."
		exit
	fi
}

function countdown()
{
	COUNTER=1000
	while true; do
		COUNTER=$(( COUNTER - 1 ))
		sleep 1
		echo COUNTER is now $COUNTER
	done
}

# define the trap that reacts on ctrl-c
trap no_int INT

# run the command on something that will be restarted after receiving SIGINT
#this fails if you do it on while sleep 10000
countdown
