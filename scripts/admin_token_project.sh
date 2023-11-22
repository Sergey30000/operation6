#!/bin/bash
if command -v curl &> /dev/null; then
	url="http://localhost:3001/api/user/login"
	curl -X POST -H "Content-Type: application/json" -d '{"login":"admin","password":"admin"}' $url
	exit 1
else
	echo "You need to install curl"
	exit 1
fi
