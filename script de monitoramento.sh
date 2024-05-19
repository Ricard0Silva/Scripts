#!/bin/bash

echo "********************************************************************"

date
echo
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
        echo "Httpd esta rodando."
else
        echo "Httpd não esta rodando"
        echo "Iniciando o serviço Httpd"
        systemctl start httpd
        if [ $? -eq 0 ]
        then
                echo "serviço iniciado com sucesso!!"
        else
                echo "inicialização do serviço falhou!!"
        fi

fi
echo "*********************************************************************"
