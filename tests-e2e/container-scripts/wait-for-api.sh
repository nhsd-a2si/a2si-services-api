#!/bin/sh
#############################################################
# wait-for-api.sh
# ---------------
#
# Wait for API to come up then run the remainder of the args.
#############################################################
set -e
CMD="$@"
until nc -z $API_HOST $API_PORT
do
	>&2 echo "Waiting for $API_HOST:$API_PORT to become available"
	sleep 0.5
done

>&2 echo "$WAIT_HOST:$WAIT_PORT is up - running $CMD"
exec $CMD
