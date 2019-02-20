#!/bin/sh
###
# Build script for functional and unit tests
# ------------------------------------------
#
# Run this from the top level of the project.
###
set -e
echo "Building a2siservicesapi-unittest image"
docker build -t a2siservicesapi-unittest -f Dockerfile.dev .
echo "Building pycodestyle linter image"
docker build -t pycodestyle pycodestyle
