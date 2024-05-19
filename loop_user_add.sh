#!/bin/bash

# adicionando usuarios com for.

MYUSERS="alpha beta gama"

for usr in $MYUSERS
do
        echo "adicionando o usuario $usr."
        useradd $usr
        id $usr
        echo "*************************************************"
done
