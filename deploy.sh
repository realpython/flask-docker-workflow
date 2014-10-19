#!/bin/bash

echo "getting currently running flask-docker-workflow container"
OLDPORT=( `docker ps | grep flask-docker-workflow | awk '{print $1}'` )

echo "pulling new version"
docker pull mjhea0/flask-docker-workflow

echo "removing old container"
docker kill ${OLDPORT}

echo "starting new container"
docker run -d -p 80:80 mjhea0/flask-docker-workflow