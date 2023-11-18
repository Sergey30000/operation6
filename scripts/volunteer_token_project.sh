#!/bin/bash
if command -v curl &> /dev/null; then
	url="http://localhost:3001/api/user/login"
	curl -X POST -H "Content-Type: application/json" -d '{"login":"volunteer","password":"volunteer"}' $url
else
	echo "You need to install curl"
fi
