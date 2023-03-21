FROM ubuntu
RUN apt update
RUN apt install apache2 -y
ADD . /vav/www/html
ENTRYPOINT apachectl -D FOREGROUND
