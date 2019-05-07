#!/bin/sh
#
# migrate-then-start.sh
# ---------------------
#
# Run migration and then start whichever command was specified.
#
# Note that the host and port for the db wait are derived from env vars, not args.
#
START_CMD="$@"

>&2 echo "Checking availability of db on $DJANGO_DB_HOST:$DJANGO_DB_PORT"
until nc -z $DJANGO_DB_HOST $DJANGO_DB_PORT
do
	>&2 echo "Waiting for db to become available on $DJANGO_DB_HOST:$DJANGO_DB_PORT"
	sleep 0.5
done
# TODO - Constrain this next step to only running on one of the container instances in prod
>&2 echo "$DJANGO_DB_HOST:$DJANGO_DB_PORT is up - running migrations"
/code/manage.py migrate
>&2 echo "Running $START_CMD"
exec $START_CMD
