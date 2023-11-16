#!/bin/bash
dropdb -U postgres -h localhost -p 5432 -W Profcom
createdb -U postgres -h localhost -p 5432 -W Profcom
rm -rf /home/sergey/operation6/Server
killall node
