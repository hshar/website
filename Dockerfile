FROM ubuntu
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 -y 
ADD . /var/www/html
ENTRYPOINT [ "apachectl","-D","FOREGROUND" ]
