FROM ubuntu 
RUN apt-get update -y && apt-get install -y apache2
WORKDIR   /var/www/html
COPY . /var/www/html
EXPOSE 82
CMD ["apache2ctl", "-D", "FOREGROUND"]
