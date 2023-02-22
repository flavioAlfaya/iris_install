#!/bin/bash

# Atualiza os pacotes do sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instala o Node.js
sudo apt-get install nodejs -y

# Baixa o repositório específico do Git
git clone https://github.com/flavioAlfaya/iris.git iris

# Entra na pasta do repositório clonado
cd iris

echo "IRIS_PORT = 5000" > .env
#echo "VARIAVEL2=valor2" >> .env

# Instala as dependências do projeto
npm install

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
