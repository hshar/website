FROM ubuntu
RUN apt-get update
RUN sudo apt-get install apache2 -y
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
