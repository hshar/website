FROM ubuntu
RUN if [ -f /var/www/html/index.html ]; then rm /var/www/html/index.html; fi
ADD ./index.html /var/www/html
