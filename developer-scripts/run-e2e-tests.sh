#!/bin/sh
###
# Run End-to-End tests
# ----------------------------------------
#
# Run this from the top level of the project.
###
echo "Building End-to-End test images"
docker-compose -f tests-e2e/docker-compose.e2etest.yml build

echo "Running End-to-End tests"
docker-compose -f tests-e2e/docker-compose.e2etest.yml run --rm e2etest
STATUS=$?

echo "Cleaning up containers"
docker-compose -f tests-e2e/docker-compose.e2etest.yml down

exit $STATUS
