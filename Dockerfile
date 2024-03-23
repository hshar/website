FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y apache2
ADD . /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
