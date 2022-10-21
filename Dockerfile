FROM ubuntu
RUN apt update
RUN apt install apache2 -y
ADD . /var/ww/html
ENTRYPOINT apachectl -D FOREGROUND

