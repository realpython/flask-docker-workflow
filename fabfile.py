###############
### imports ###
###############

from fabric.api import run, env


##############
### config ###
##############

env.hosts = ['104.131.123.130']  # replace with IP address or hostname
env.user = 'root'


#############
### tasks ###
#############

def deploy():
    """
    1. Get the PID of current running container
    2. Pull latest image from docker hub
    3. Kill the current container
    4. Run the new container
    """
    run("OLDPORT=( `docker ps | grep flask-docker-workflow | awk '{print $1}'` )")
    run("docker pull mjhea0/flask-docker-workflow")
    run("docker kill ${OLDPORT}")
    run("docker run -d -p 80:80 mjhea0/flask-docker-workflow")
