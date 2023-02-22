#!/bin/bash

# Atualiza os pacotes do sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instala o Node.js
sudo apt-get install nodejs -y

# Baixa o repositório específico do Git
git clone https://github.com/nome-do-repositorio.git

# Entra na pasta do repositório clonado
cd nome-do-repositorio

# Instala as dependências do projeto
npm install

# Inicia o projeto
npm start

# Cria um serviço Systemd para o script
sudo bash -c 'cat > /etc/systemd/system/nome-do-servico.service <<EOF
[Unit]
Description=Meu Script

[Service]
ExecStart=/caminho/do/meu/script.sh

[Install]
WantedBy=multi-user.target
EOF'

# Recarrega as configurações do Systemd
sudo systemctl daemon-reload

# Inicia o serviço automaticamente na inicialização
sudo systemctl enable nome-do-servico.service
