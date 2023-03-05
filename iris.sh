#!/bin/bash

# Updates system packeges
apt-get update
apt-get upgrade -y

# install wget
apt-get install wget

# install python
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz -y
tar xzf Python-3.9.1.tgz
cd Python-3.9.1
/configure --enable-optimizations
make -j 2
make alt install -y

# install Node.js
apt-get install nodejs -y

# go to root folder
cd ..

# download repository from Git
git clone https://github.com/flavioAlfaya/iris.git iris

# go to cloned folder
cd iris

echo "IRIS_PORT = 5000" > .env
echo "IRIS_DB=irisDB" >> .env

# update npm version 
npm install -g npm

# isntall project dependencies 
npm install

# start projeto
npm start

# # Cria um serviço Systemd para o script
# bash -c 'cat > /etc/systemd/system/iris.service <<EOF
# [Unit]
# Description=inicialização do servidor iris

# [Service]
# ExecStart=/data/data/com.termux/files/home/iris/start.sh

# [Install]
# WantedBy=multi-user.target
# EOF'

# # Recarrega as configurações do Systemd
# systemctl daemon-reload

# # Inicia o serviço automaticamente na inicialização
# systemctl enable iris.service

# Copy the script to /etc/init.d/ and make it executable
cp iris.sh /etc/init.d/
chmod +x /etc/init.d/iris.sh

# Create the service symlink and enable it
update-rc.d iris.sh defaults
systemctl enable iris.sh
