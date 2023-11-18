#!/bin/bash
cd ~
if [ -d "./operation6_Moiseenko" ]; then
	cd ./operation6_Moiseenko
	git status
	if pg_config &> /dev/null; then
		psql -U postgres -h localhost -p 5432 -d Profcom -W <<EOF
\dt
\q
EOF
	else
		echo "You need to install PostgreSql"
	fi
else
	echo "There ./operation6_Moiseenko is no path"
fi
