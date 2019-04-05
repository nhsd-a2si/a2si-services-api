#!/bin/sh
###
# Run UI End-to-End tests
# ----------------------------------------
#
# Run this from the top level of the project.
###
echo "Building UI End-to-End test images"
docker-compose -f e2e-test-ui/docker-compose.yml build

echo "Running UI End-to-End tests"
docker-compose -f e2e-test-ui/docker-compose.yml run --rm e2etestui
STATUS=$?

echo "Cleaning up containers"
docker-compose -f e2e-test-ui/docker-compose.yml down

exit $STATUS
