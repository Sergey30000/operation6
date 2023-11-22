#!/bin/bash
if command -v curl &> /dev/null; then
	url1="http://localhost:3001/api/feedback/req";
	for ((i=1;i<=50;i++))
	do
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Andrey","commentatorSurname":"Andreev","comment":"comment 1","estimation":5}' $url1;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Timur","commentatorSurname":"Timurov","comment":"comment 2","estimation":5}' $url1;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Vasiliy","commentatorSurname":"Vasiliev","comment":"comment 3","estimation":5}' $url1;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Oleg","commentatorSurname":"Olegov","comment":"comment 4","estimation":5}' $url1;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"commentatorName":"Egor","commentatorSurname":"Egorov","comment":"comment 5","estimation":5}' $url1;
	done


	url2="http://localhost:3001/api/guestRequest/volunteer/req";
	for ((i=1;i<=50;i++))
	do
		curl -X POST -H "Content-Type: application/json" -d '{"surname":"Andreev","name":"Andrey","patronymic":"Andreevich","phone":"+78007006052","commentGuest":"commentGuest 1"}' $url2;
		curl -X POST -H "Content-Type: application/json" -d '{"surname":"Timurov","name":"Timur","patronymic":"Timurovich","phone":"+78007006053","commentGuest":"commentGuest 2"}' $url2;
		curl -X POST -H "Content-Type: application/json" -d '{"surname":"Vasiliev","name":"Vasiliy","patronymic":"Vasilievich","phone":"+78007006054","commentGuest":"commentGuest 3"}' $url2;
		curl -X POST -H "Content-Type: application/json" -d '{"surname":"Olegov","name":"Oleg","patronymic":"Olegovich","phone":"+78007006055","commentGuest":"commentGuest 4"}' $url2;
		curl -X POST -H "Content-Type: application/json" -d '{"surname":"Egorov","name":"Egor","patronymic":"Egorovich","phone":"+78007006056","commentGuest":"commentGuest 5"}' $url2;
	done

	url3="http://localhost:3001/api/commentingApplication/";
	for ((i=1;i<=50;i++))
	do
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":1}' $url3;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":2}' $url3;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":3}' $url3;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":4}' $url3;
		curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $1" -d '{"content":"ждите звонка","userId":2,"guestRequestId":5}' $url3;
	done
	exit 1
else
	echo "You need to install curl"
	exit 1
fi
