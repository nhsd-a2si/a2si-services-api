#!/bin/sh
#
# migrate-then-start.sh
# ---------------------
#
# Run migration and then start whichever command was specified
#
START_CMD="$@"
>&2 echo "Running migrations"
/code/manage.py migrate
>&2 echo "Running $START_CMD"
exec $START_CMD
