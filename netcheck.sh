#!/bin/bash

MARKER=`dirname $0`/connection_lost
LOGFILE=`dirname $0`/`basename $0 .sh`.log

function log()
{
	echo "[`date '+%Y-%m-%d %H:%M:%S'`] $*" >>"$LOGFILE"
}

ping -c 1 1.1.1.1 2>&1 >/dev/null
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
