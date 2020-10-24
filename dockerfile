
FROM ubuntu

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get install -y apache2 


RUN rm /var/www/html/index.html

ADD ./index.html /var/www/html
