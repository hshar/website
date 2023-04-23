FROM hshar/webapp
RUN apt update
RUN apt install apache2 -y && apt install git -y
RUN rm -rf /var/www/html/*
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
ADD index.html /var/www/html/
ADD images /var/www/html/images/
