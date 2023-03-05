#!/bin/bash

# Updates system packeges
apt-get update
apt-get upgrade -y

apt update
apt full-upgrade -y
apt install build-essential git curl
apt install -y python3

apt-get install npm -y

# install Node.js
apt-get install nodejs -y

# download repository from Git
git clone https://github.com/flavioAlfaya/iris.git iris

# go to cloned folder
cd iris

echo "IRIS_PORT = 5000" > .env
echo "IRIS_DB=irisDB" >> .env

# install project dependencies 
npm install

# install sqlite3
npm install sqlite3 --build-from-source --sqlite=/data/data/com.termux/files/usr/bin/sqlite3

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
