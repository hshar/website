FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y apache2
COPY . /var/www/html
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]

