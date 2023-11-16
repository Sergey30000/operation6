#!/bin/bash
cd /home/sergey/operation6
git status
psql -U postgres -h localhost -p 5432 -d Profcom -W <<EOF
\dt
\q
EOF
