From ubuntu:latest
RUN apt-get update
RUN apt-get install apache2 -y
ADD . /var/www/html
