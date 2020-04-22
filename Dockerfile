#Base Image
FROM ubuntu:18.04

#Author
MAINTAINER vikas

# install apache
RUN apt-get update
RUN apt-get install -y apache2

ADD images /var/www/html/
ADD index.html /var/www/html/

#Expose Apache
EXPOSE 80
# Container boots
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND 
