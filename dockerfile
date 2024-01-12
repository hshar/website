FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y apache2
cmd ['apachectl' '-D' 'FOREGROUND']
