#!/bin/bash

# Atualiza os pacotes do sistema
apt-get update
apt-get upgrade -y

# instala o sudo


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

# Cria um serviço Systemd para o script
bash -c 'cat > /etc/systemd/system/iris.service <<EOF
[Unit]
Description=inicialização do servidor iris

[Service]
ExecStart=/data/data/com.termux/files/home/iris/start.sh

[Install]
WantedBy=multi-user.target
EOF'

# Recarrega as configurações do Systemd
systemctl daemon-reload

# Inicia o serviço automaticamente na inicialização
systemctl enable iris.service

# Inicia o projeto
npm start
