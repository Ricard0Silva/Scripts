#!/bin/bash

# Declarando variaveis.
PACKAGE="httpd wget unzip"
SVC="httpd"
# URL="https://www.tooplate.com/zip-templates/2098_health.zip"
# ART_NAME="2098_health"
TEMPDIR="/tmp/webfiles"


# Instalando depedencias
echo "#######################################################"
echo "instalando pacotes"
echo "#######################################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# habilitando e iniciando serviço
echo "#######################################################"
echo "start e enable do serviço httpd"
echo "#######################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Criando a pasta arquivos web em temp
echo "#######################################################"
echo "Iniciando implatação"
echo "#######################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

# Dowload do modelo do site há ser hospedado no serviço onde $1 será subistituindo pelo argumento que sera um link de dowload.
wget $1 > /dev/null

# Descompactando arquivos onde $2 será subistituindo pelo argumento
unzip $2.zip > /dev/null

# Copiando arquivos para pasta do serviço HTTPD onde $2 será subistituindo pelo argumento.
sudo cp -r $2/* /var/www/html/


echo

# Reiniciando o serviço HTTPH
echo "#######################################################"
echo "Reiniciando serviço HTTPD"
echo "#######################################################"
systemctl restart $SVC
echo
# Limpando arquivos temporarios do diretorio TMP.
echo "#######################################################"
echo "Limpando arquivos temporarios "
echo "#######################################################"
rm -rf $TEMPDIR
echo
