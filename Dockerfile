FROM hshar/webapp
 
# Copy the website source into Apache's document root
COPY . /var/www/html
 
EXPOSE 80
 
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]