#!/bin/bash
for ((b=0; b<=7; b++))
{
    tput setab  9; tput setaf  9; echo -n "|"
    for ((f=0; f<=7; f++))
    {
        tput setab $b; tput setaf $f; echo -n " b=$b f=$f "
        tput setab  9; tput setaf  9; echo -n "|"
    }
    echo
}
tput setab 9; tput setaf 9
