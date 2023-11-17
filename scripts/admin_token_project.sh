#!/bin/bash
url="http://localhost:3001/api/user/login"
curl -X POST -H "Content-Type: application/json" -d '{"login":"admin","password":"admin"}' $url
