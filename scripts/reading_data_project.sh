#!/bin/bash
if command -v curl &> /dev/null; then
	url1="http://localhost:3001/api/user/admin/req";
	curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url1;

	url2="http://localhost:3001/api/credential/";
	curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url2;

	url3="http://localhost:3001/api/feedback/";
	curl -X GET -H "Content-Type: application/json" $url3;

	url4="http://localhost:3001/api/guestRequest/admin/statusStatistics";
	curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url4;

	url5="http://localhost:3001/api/commentingApplication/";
	curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $1" $url5;
	exit 1
else
	echo "You need to install curl"
	exit 1
fi
