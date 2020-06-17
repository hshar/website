FROM ubuntu

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 -y 
ADD ./index.html /var/www/html
ADD images /var/www/html/images
ENTRYPOINT [ "apachectl","-D","FOREGROUND" ]
