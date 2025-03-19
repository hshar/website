FROM ubuntu
RUN apt update
RUN apt install apache2 -y
Add . /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
