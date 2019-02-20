#!/bin/sh
#########################################################
# wait-for-service.sh
# -------------------
#
# Wait for a service then run the remainder of the args.
#########################################################
set -e
WAIT_HOST="$1" ; shift
WAIT_PORT="$1" ; shift
CMD="$@"
until nc -z $WAIT_HOST $WAIT_PORT
do
	>&2 echo "Waiting for $WAIT_HOST:$WAIT_PORT to become available"
	sleep 0.5
done

>&2 echo "$WAIT_HOST:$WAIT_PORT is up - running $CMD"
exec $CMD
