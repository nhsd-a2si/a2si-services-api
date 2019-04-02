#!/bin/sh
###
# Run API End-to-End tests
# ----------------------------------------
#
# Run this from the top level of the project.
###
echo "Building API End-to-End test images"
docker-compose -f e2e-test-api/docker-compose.yml build

echo "Running API End-to-End tests"
docker-compose -f e2e-test-api/docker-compose.yml run --rm e2etestapi
STATUS=$?

echo "Cleaning up containers"
docker-compose -f e2e-test-api/docker-compose.yml down

exit $STATUS
