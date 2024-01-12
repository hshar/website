FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y apache2
COPY . /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]
