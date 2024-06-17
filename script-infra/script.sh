#!/bin/bash

echo "Atualizando o servidor..."
apt-get update
apt-get upgrade -y

echo "Instalando o apache2..."
apt-get install apache2 -y

echo "Instalando o unzip..."
apt-get install unzip -y

echo "Instalando o git..."
apt installl git -y

echo "Baixando a aplicação..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Descompactar a aplicação..."
unzip main.zip

echo "Copiar a aplicação para o servidor..."
cd linux-site-dio-main
cp -R * /var/www/html/

echo "Finalizado"