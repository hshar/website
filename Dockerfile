FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
WORKDIR  /var/www/html
COPY index.html /var/www/html
COPY images /var/www/html

