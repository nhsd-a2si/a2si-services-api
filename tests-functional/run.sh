#!/bin/sh
###
# Run script for functional and unit tests
# ----------------------------------------
#
# Run this from the top level of the project.
###
set -e
echo "Running linter tests"
docker run --rm \
    -v "`pwd`:/code" \
    pycodestyle \
    /code/services
echo "Running functional and unit tests"
docker run --rm \
    -e "DJANGO_SECRET_KEY=NotReallyASecret" \
    -v "`pwd`:/code" \
    a2siservicesapi-unittest \
    /code/services/manage.py test ./services
