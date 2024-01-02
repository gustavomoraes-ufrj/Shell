#!/bin/bash
#
# Exclui CDs versão 1
#
grep -v "$*" Musicas > /tmp/Mus$$
mv -f /tmp/Mus$$  Musicas