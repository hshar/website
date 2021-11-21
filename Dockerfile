FROM hashar/webapp
ADD . /var/www/html
RUN adpt-get update
