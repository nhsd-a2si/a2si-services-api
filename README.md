# a2si-services-api

Framework and helpers to expose a Services API and onboarding / test facilities to the
public internet.

## Developer Notes

### Getting set up

Everything runs inside Docker - even tests - so there aren't any dependencies for this project
other than having the most recent version of [Docker Desktop](https://www.docker.com/products/docker-desktop)
installed.

### Running unit and functional tests
Both unit and functional tests are set up to run as part of the Django test suite. This runs at
a code-only level - no stack - and so these are the fastest tests to run.

They test not only the operation of the framework but also the behaviour of the actual Services API.
```
$ docker build -t a2si-services-api .
$ docker run --rm -e "DJANGO_SECRET_KEY=NotReallyASecret" -v "`pwd`:/code" a2si-services-api ./services/manage.py test ./services
```
