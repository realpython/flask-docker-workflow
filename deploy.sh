OLDPORT=( `docker ps | grep flask-docker-workflow | awk '{print $1}'` )
docker pull mjhea0/flask-docker-workflow
docker kill ${OLDPORT}
docker run -d -p 80:80 mjhea0/flask-docker-workflow