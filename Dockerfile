FROM ubuntu 
RUN apt-get update
RUn apt install apache2
ADD index.html /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
