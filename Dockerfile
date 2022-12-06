FROM ubuntu
RUN apt-get update
RUN apt-get install -y apche2
ADD . /var/www/html

