#!/bin/bash

# Declarando variaveis.
PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
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

# Dowload do modelo do site há ser hospedado no serviço.
wget $URL > /dev/null

# Descompactando arquivos
unzip $ART_NAME.zip > /dev/null

# Copiando arquivos para pasta do serviço HTTPD
sudo cp -r $ART_NAME/* /var/www/html/


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