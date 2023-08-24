#Author:VTONG
#Date:01/06/2023
#Dockerfile Purpose:Auto-Build Custom Image
#Version: 1.0
FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install apache2
COPY . /var/www/html
EXPOSE 80
ENTRYPOINT apachectl -D FOREGROUND
ENV name Devops Valentine Tong