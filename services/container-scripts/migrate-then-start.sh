#!/bin/sh
#
# migrate-then-start.sh
# ---------------------
#
# Run migration and then start whichever command was specified
#
DB_HOST="$1" ; shift
DB_PORT="$1" ; shift
START_CMD="$@"

until nc -z $DB_HOST $DB_PORT
do
	>&2 echo "Waiting for db to become available on $DB_HOST:$DB_PORT"
	sleep 0.5
done
>&2 echo "$DB_HOST:$DB_PORT is up - running migrations"
/code/manage.py migrate
>&2 echo "Running $START_CMD"
exec $START_CMD
