#!/bin/bash
cd ~
cd ./operation6_Moiseenko
git status
psql -U postgres -h localhost -p 5432 -d Profcom -W <<EOF
\dt
\q
EOF
