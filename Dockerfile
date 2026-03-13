FROM ubuntu:20.04

RUN apt update
RUN apt install apache2 -y

COPY . /var/www/html/

CMD ["apachectl", "-D", "FOREGROUND"]
