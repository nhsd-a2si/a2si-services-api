#!/bin/sh
###
# Run End-to-End tests
# ----------------------------------------
#
# Run this from the top level of the project.
###
echo "Building End-to-End test images"
docker-compose -f e2e-test-api/docker-compose.yml build

echo "Running End-to-End tests"
docker-compose -f e2e-test-api/docker-compose.yml run --rm e2etestapi
STATUS=$?

echo "Cleaning up containers"
docker-compose -f e2e-test-api/docker-compose.yml down

exit $STATUS
