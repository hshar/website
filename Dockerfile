FROM ubuntu
RUN apt update
RUN install apache2 -y
ENTRYPOINT apachectl -D FOREGROUND
COPY . /var/www/html
