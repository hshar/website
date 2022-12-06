FROM ubuntu
RUN apt-get update && apt-get install -y apche2
ADD . /var/www/html

