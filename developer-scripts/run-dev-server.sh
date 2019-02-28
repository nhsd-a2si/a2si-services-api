#!/bin/sh
###
# Run Django dev server
# ----------------------------------------
#
# Run this from the top level of the project.
###
PORT=8000
echo "Building a2siservicesapi-devserver image"
docker build \
	-t a2siservicesapi-devserver \
	-f Dockerfile.dev \
	.

echo "Running dev server on localhost:$PORT"
docker run --rm \
     -e "DJANGO_SECRET_KEY=NotReallyASecret" \
     -e "DJANGO_DEBUG_MODE=1" \
     -p "$PORT:8000" \
     -v "`pwd`:/code" \
     a2siservicesapi-devserver \
     ./services/manage.py runserver 0.0.0.0:$PORT
