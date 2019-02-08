#!/bin/sh
###
# Build script for functional and unit tests
# ------------------------------------------
#
# Run this from the top level of the project.
###
set -e
echo "Building a2si-services-api image"
docker build -t a2si-services-api -f Dockerfile.dev .
echo "Building pycodestyle linter image"
docker build -t pycodestyle pycodestyle
