#!/bin/bash

# marker-file to store that connction was lost on last check
MARKER=`dirname $0`/connection_lost
# logfile
LOGFILE=`dirname $0`/`basename $0 .sh`.log

# log to logfile with current timestamp
function log()
{
	echo "[`date '+%Y-%m-%d %H:%M:%S'`] $*" >>"$LOGFILE"
}

# ping a public ip so we don't have to care about dns errors
TARGETS="1.1.1.1 8.8.8.8 www.google.de"

result=0
output=""
for t in $TARGETS; do
	output=`ping -W 5 -c 1 $t 2>&1`
	result=$?
	[ $result -eq 0 ] && break
	log "$output"
	sleep 5
done
if [ $result -eq 0 ]; then
	# internet available
	if [ -f "$MARKER" ]; then
		log "internet connection recovered"
		rm "$MARKER"
	fi
else
	# internet not available
	if [ ! -f "$MARKER" ]; then
		log "internet connection lost"
		touch "$MARKER"
	fi
fi
