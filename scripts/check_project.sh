#!/bin/bash
cd $(dirname $0)
cd ..
git status
if command -v pg_config &> /dev/null; then
	psql -U postgres -h localhost -p 5432 -d Profcom -W <<EOF
\dt
\q
EOF
	exit 1
else
	echo "You need to install PostgreSql"
	exit 1
fi
