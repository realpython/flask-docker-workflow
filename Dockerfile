# Start with an Ubuntu base image
FROM ubuntu:14.10
MAINTAINER Real Python <info@realpython.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y supervisor
RUN apt-get install -y python
RUN apt-get install -y python-dev
RUN apt-get install -y python-pip
RUN pip install uwsgi flask

# Copy the projects working directories in to the container
ADD ./app /app
ADD ./config /config

# Setup Nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default

# Add in our local Nginx and Supervisor configuration files
RUN ln -s ./config/nginx.conf /etc/nginx/sites-enabled/
RUN ln -s ./config/supervisor.conf /etc/supervisor/conf.d/

# Expose - aka make accessible - port 80, where nginx will be running
EXPOSE 80
CMD ["supervisord", "-n"]