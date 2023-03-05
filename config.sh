#!/bin/bash

# Atualiza os pacotes do sistema
apt-get update
apt-get upgrade -y
apt update 
apt upgrade
apt install sudo

# instala o sudo


# Instala o Node.js
sudo apt-get install nodejs -y

# Vai para a pasta raiz
cd ..

# Baixa o repositório específico do Git
git clone https://github.com/flavioAlfaya/iris.git iris

# Entra na pasta do repositório clonado
cd iris

echo "IRIS_PORT = 5000" > .env
echo "IRIS_DB=irisDB" >> .env

# Instala as dependências do projeto
sudo npm install

# Cria um serviço Systemd para o script
sudo bash -c 'cat > /etc/systemd/system/iris.service <<EOF
[Unit]
Description=inicialização do servidor iris

[Service]
ExecStart=/data/data/com.termux/files/home/iris/start.sh

[Install]
WantedBy=multi-user.target
EOF'

# Recarrega as configurações do Systemd
sudo systemctl daemon-reload

# Inicia o serviço automaticamente na inicialização
sudo systemctl enable iris.service

# Inicia o projeto
npm start
