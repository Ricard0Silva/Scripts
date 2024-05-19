#!/bin/bash

# Instalando depedencias
echo "#######################################################"
echo "instalando pacotes"
echo "#######################################################"
sudo yum install wget unzip httpd -y
echo

# habilitando e iniciando serviço
echo "#######################################################"
echo "start e enable do serviço httpd"
echo "#######################################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Criando a pasta arquivos web em temp
echo "#######################################################"
echo "Iniciando implatação"
echo "#######################################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

# Dowload do modelo do site há ser hospedado no serviço.
wget https://www.tooplate.com/zip-templates/2098_health.zip

# Descompactando arquivos
unzip 2098_health.zip

# Copiando arquivos para pasta do serviço HTTPD
sudo cp -r 2098_health.zip/* /var/www/html/
echo

# Reiniciando o serviço HTTPH
echo "#######################################################"
echo "Reiniciando serviço HTTPD"
echo "#######################################################"
systemctl restart httpd
echo
# Limpando arquivos temporarios do diretorio TMP.
echo "#######################################################"
echo "Limpando arquivos temporarios "
echo "#######################################################"
rm -rf /tmp/webfiles
echo

