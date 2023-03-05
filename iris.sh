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

mkdir images

# install project dependencies 
npm install

# install sqlite3
npm install sqlite3 --build-from-source --sqlite=/data/data/com.termux/files/usr/bin/sqlite3

# start projeto
npm start
