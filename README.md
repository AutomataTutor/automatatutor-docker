# Dockerfiles for Automatatutor

These dockerfiles clone a fixed version of the frontend of automatatutor and build docker-images from them.
The frontend can be found at <https://github.com/lorisdanto/automatatutor-frontend>
Currently the fixed version is revision `0f691cc`.

Since setting up the build environment takes quite some time which would slow down rebuilding the image, the setup and the actual building have been separated into two dockerfiles, `build.Dockerfile` and `run.Dockerfile`.
The latter one depends on the result of the former one.

## Prerequesites

- Docker 1.10.2

## Quick start

- `git clone git@github.com:aweinert/automatatutor-docker.git`
- `docker build -t tutor-build -f build.Dockerfile .`
- `docker build -t tutor -f run.Dockerfile .`
- `docker run -p 8080 tutor`

## Not quite so quick start

This assumes that you already have [Docker](https://www.docker.com) installed and ready to go.
You can check whether or not docker is available on your system by running `docker info`.

If you have docker available, first clone this repository using

    git clone git@github.com:aweinert/automatatutor-docker.git

Once that is done, you can build an image of the build-environment by typing

    docker build -t tutor-build -f build.Dockerfile .

This will take quite some time, as it will download, among others, [scala](http://www.scala-lang.org), [sbt](http://www.scala-sbt.org), and [liftweb](http://liftweb.net).
It is important that you do not change the tag `tutor-build`, as `run.Dockerfile` depends on this name.
Once this command is finished, you will have a new image named `tutor-build` available in docker.
You can then build the actual image of automatatutor using

    docker build -t tutor -f run.Dockerfile .

which builds an image called `tutor` and adds it to your local docker-installation.
This image, when started, runs the frontend of automatatutor, which listens on port 8080.
In order to make this port available on your host system, specify it when starting the image in a container using

    docker run -p 8080 tutor

The output will then pick a random free port on the host machine and bind the container's port 8080 to this port.
It will tell you which port it chose on the console output.
You can also find the port binding using `docker ps`.
