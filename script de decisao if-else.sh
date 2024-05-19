#!/bin/bash

read -p "entre com um numero: " NUM
echo


if [ $NUM -gt 100 ]
then
        echo "Vovê entrou no bloco!"
        sleep 3
        echo "Seu numero é maior que 100"
        date
else
        echo "Você precisa entrar com um numero maior que 100"

fi
echo "***********************************"
echo
echo "Script executado com sucesso!!!"
echo
echo "***********************************"
