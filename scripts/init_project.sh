#!/bin/bash
sudo apt install npm
cd ~
cd ./operation6_Moiseenko/Server
sudo apt install curl
npm install
sudo apt install postgresql
createdb -U postgres -h localhost -p 5432 -W Profcom
