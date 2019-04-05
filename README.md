# a2si-services-api

Framework and helpers to expose a Services API and onboarding / test facilities to the
public internet.

This is currently an alpha / Proof of Concept.

Infrastructure provision is set out in the [a2si-services-api-infrastructure](https://github.com/nhsd-a2si/a2si-services-api-infrastructure)
repo.

[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/mcbhenwood/nhsd-a2si%2Fa2si-services-api%2Fa2si-services-api?branch=master&key=eyJhbGciOiJIUzI1NiJ9.NWM1ODM1YTdmMTZlNTQ2YjBjY2U0MWRl.x_m0MBZbiG5Pv3RP3jXMQOF56t2HyjRFuoOxyLHBzrE&type=cf-1)]( https://g.codefresh.io/pipelines/a2si-services-api/builds?repoOwner=nhsd-a2si&repoName=a2si-services-api&serviceName=nhsd-a2si%2Fa2si-services-api&filter=trigger:build~Build;branch:master;pipeline:5ca76c5e53c6dd5550f9ccea~a2si-services-api)

## Developer Notes

### Getting set up

Everything runs inside Docker - even tests - so there aren't any dependencies for this project
other than having the most recent version of [Docker Desktop](https://www.docker.com/products/docker-desktop)
installed.

### Running the Django dev server
This will expose the Django dev server on localhost port 8000:
```
$ developer-scripts/run-dev-server.sh
```
The 'run' command maps your local folders to the Docker container so the command will run using the
code as it looks right now on your machine.

Verify the noddy 'placeholder' API like this:
```
$ curl -H "Content-Type: application/json" http://localhost:8000/placeholder/
{"message":"This is the Placeholder API"}
```
Or view it in a browser with descriptions etc, by going to <http://localhost:8000/placeholder/>

### Running unit and functional tests
Both unit and functional tests are set up to run as part of the Django test suite. This runs at
a code-only level - no stack - and so these are the fastest tests to run.

They test not only the operation of the framework but also the behaviour of the actual Services API.

They are preceded by a linting stage in which the code is checked for compliance with
(PEP-8)[https://www.python.org/dev/peps/pep-0008/] and if this linting fails, no further tests are
run.

These tests can be run by running this _from the top level of the project_:
```
$ developer-scripts/run-functional-tests.sh
```

### Running the End-to-End tests

End to end tests require that the API be spun up and then interrogated from a separate container.
These tests can be run as follows from the top level of the project.

To run the tests for the API functionality:
```
$ developer-scripts/run-e2e-tests-api.sh
```

To run the tests for the UI functionality:
```
$ developer-scripts/run-e2e-tests-ui.sh
```
