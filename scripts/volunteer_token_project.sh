#!/bin/bash
url="http://localhost:3001/api/user/login"
curl -X POST -H "Content-Type: application/json" -d '{"login":"volunteer","password":"volunteer"}' $url
