FROM sramananece/apache
ADD ./index.html /var/www/html
ADD ./images /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
