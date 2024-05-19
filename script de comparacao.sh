#!/bin/bash

echo -n "entre com um numero:"
read VAR

if [ $VAR -gt 10 ]
then
        echo "o numero é maior que 10"
elif [ $VAR -eq 10 ]
then
        echo "o numero é igual a 10."
else
        echo "o numero é menor que 10."

fi