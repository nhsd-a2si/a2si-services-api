#!/bin/sh
###
# Run Django dev server
# ----------------------------------------
#
# Run this from the top level of the project.
###
set -e

echo "Building a2siservicesapi-devserver image"
docker-compose -f services/docker-compose.yml build

echo "Running dev server"
docker-compose -f services/docker-compose.yml up
