FROM ubuntu
RUN apt updatee
RUN apt install apache2 -y
ADD . /var/www/html
ENTRYPOINT apache2ctl -D FOREGROUND
