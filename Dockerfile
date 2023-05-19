FROM ubuntu
RUN apt-get update
RUN apt-get update && apt-get install apache2 -y
ADD images index.html /var/www/html/
