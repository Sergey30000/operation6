#!/bin/bash
count=$(pgrep -f node | grep -v "grep" | wc -l)
if [ $count > 0 ]; then
	killall node
fi
