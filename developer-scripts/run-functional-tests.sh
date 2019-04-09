#!/bin/sh
###
# Run script for functional and unit tests
# ----------------------------------------
#
# Run this from the top level of the project.
###
set -e
echo "Building pycodestyle linter image"
docker build \
	-t pycodestyle \
	pycodestyle

echo "Building a2siservicesapi-unittest image"
docker build \
	-t a2siservicesapi-unittest \
	-f services/Dockerfile.dev \
	services

echo "Running linter tests"
docker run --rm \
    -v "`pwd`/services:/code" \
    pycodestyle \
    /code

echo "Running functional and unit tests"
docker run --rm \
    -e "DJANGO_PAGE_TITLE=A2SI Services API (prototype) - Dev" \
    -e "DJANGO_SECRET_KEY=NotReallyASecret" \
    -v "`pwd`/services:/code" \
    a2siservicesapi-unittest \
    /code/manage.py test /code
