FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 -y
COPY . /var/www/html/
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80 
