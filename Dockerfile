FROM ubuntu
RUN sudo apt-get update -y && sudo apt-get install apache2 -y
COPY . /var/www/html
CMD ["APACHECTL", "-D", "FOREGROUND"]
