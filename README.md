# a2si-services-api

Framework and helpers to expose a Services API and onboarding / test facilities to the
public internet.

This is currently an alpha / Proof of Concept.

Infrastructure provision is set out in the [a2si-services-api-infrastructure](https://github.com/nhsd-a2si/a2si-services-api-infrastructure)
repo.

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
$ docker build -t a2siservicesapi-unittest -f Dockerfile.dev .
$ docker run --rm \
    -e "DJANGO_SECRET_KEY=NotReallyASecret" \
    -v "`pwd`:/code" \
    a2siservicesapi-unittest \
    ./services/manage.py test ./services
```
(The 'build' step is only required if you have never run it or if the build details have changed
since you last ran it).

The 'run' command maps your local folders to the Docker container so the command will run using the
code as it looks right now on your machine.

### Running the Django dev server
This will expose the Django dev server on localhost port 8000:
```
$ docker build -t a2siservicesapi-devserver -f Dockerfile.dev .
$ docker run --rm \
     -e "DJANGO_SECRET_KEY=NotReallyASecret" \
     -e "DJANGO_DEBUG_MODE=1" \
     -p "8000:8000" \
     -v "`pwd`:/code" \
     a2siservicesapi-devserver \
     ./services/manage.py runserver 0.0.0.0:8000
```
(The 'build' step is only required if you have never run it or if the build details have changed
since you last ran it).

The 'run' command maps your local folders to the Docker container so the command will run using the
code as it looks right now on your machine.

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

  - *a2siservicesapi-unittest* The environment in which Django tests can be run
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
$ docker-compose -f tests-e2e/docker-compose.e2etest.yml run --rm e2etest
```
This will stop the e2etest container at the end and the exit code will be the exit code of the
tests. The e2etest container will also be removed. Dependency containers will not. These can be
stopped and removed with:
```
$ docker-compose -f tests-e2e/docker-compose.e2etest.yml down
```
