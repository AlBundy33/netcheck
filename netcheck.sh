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
ping -t 5 -c 1 1.1.1.1 2>&1 >/dev/null
if [ $? -eq 0 ]; then
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
