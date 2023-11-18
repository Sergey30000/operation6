#!/bin/bash
dropdb -U postgres -h localhost -p 5432 -W Profcom
createdb -U postgres -h localhost -p 5432 -W Profcom
cd ~
rm -rf ./operation6_Moiseenko/Server
killall node
