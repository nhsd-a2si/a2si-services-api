# a2si-services-api

Framework and helpers to expose a Services API and onboarding / test facilities to the
public internet.

This is currently an alpha / Proof of Concept.

[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/mcbhenwood/nhsd-a2si%2Fa2si-services-api%2Fa2si-services-api-test?type=cf-1)]( https://g.codefresh.io/public/accounts/mcbhenwood/pipelines/nhsd-a2si/a2si-services-api/a2si-services-api-test)

## Developer Notes

### Getting set up

Everything runs inside Docker - even tests - so there aren't any dependencies for this project
other than having the most recent version of [Docker Desktop](https://www.docker.com/products/docker-desktop)
installed.

### Running the Python linting tests against the API service
Linting - or (PEP-8)[https://www.python.org/dev/peps/pep-0008/] will be observed in this project.
This linter checks the code for adherence.
```
$ docker build -t pycodestyle pycodestyle
$ docker run --rm \
    -v "`pwd`:/code" \
    pycodestyle \
    ./services
```

### Running unit and functional tests
Both unit and functional tests are set up to run as part of the Django test suite. This runs at
a code-only level - no stack - and so these are the fastest tests to run.

They test not only the operation of the framework but also the behaviour of the actual Services API.
```
$ docker build -t a2si-services-api-unittest .
$ docker run --rm \
    -e "DJANGO_SECRET_KEY=NotReallyASecret" \
    -v "`pwd`:/code" \
    a2si-services-api-unittest \
    ./services/manage.py test ./services
```
(The 'build' step is only required if you have never run it or if the build details have changed
since you last ran it).

### Running the Django dev server
This will expose the Django dev server on localhost port 8000:
```
$ docker build -t a2si-services-api-devserver .
$ docker run --rm \
     -e "DJANGO_SECRET_KEY=NotReallyASecret" \
     -e "DJANGO_DEBUG_MODE=1" \
     -p "8000:8000" \
     -v "`pwd`:/code" \
     a2si-services-api-devserver \
     ./services/manage.py runserver 0.0.0.0:8000
```
(The 'build' step is only required if you have never run it or if the build details have changed
since you last ran it).

Verify the noddy 'placeholder' API like this:
```
$ curl -H "Content-Type: application/json" http://localhost:8000/placeholder/
{"message":"This is the Placeholder API"}
```
Or view it in a browser with descriptions etc, by going to <http://localhost:8000/placeholder/>

## Testing Notes

### Running the functional & unit tests

Both the functional and unit tests run in the Django test suite. Running these requires 2 container
images to be available:

  - *a2si-services-api* The Django project
  - *pycodestyle* The linter

These can be built by any user / external process by running this _from the top level of the
project_:
```
tests-functional/build.sh
```
Tests can then be run by running this _from the top level of the project_:
```
tests-functional/run.sh
```
Note that the tests fail immediately on the first failed step, exiting with a non-zero code.

### Running the End-to-End tests

End to end tests require that the API be spun up and then interrogated from a separate container.
These tests can be run as follows from the top level of the project:
```
$ docker-compose -f tests-e2e/docker-compose.e2etest.yml build
$ docker-compose -f tests-e2e/docker-compose.e2etest.yml run e2etest
```
