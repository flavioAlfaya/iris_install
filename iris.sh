#!/bin/bash

# Atualiza os pacotes do sistema
apt-get update
apt-get upgrade -y

# instala o systemctl
apt-get -y install systemctl

# Instala o Node.js
apt-get install nodejs -y

# Vai para a pasta raiz
cd ..

# Baixa o repositório específico do Git
git clone https://github.com/flavioAlfaya/iris.git iris

# Entra na pasta do repositório clonado
cd iris

echo "IRIS_PORT = 5000" > .env
echo "IRIS_DB=irisDB" >> .env

# Instala as dependências do projeto
npm install

# Inicia o projeto
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



