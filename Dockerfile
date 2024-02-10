FROM hshar/webapp
# Install tidy
RUN apt-get update && apt-get install -y tidy
RUN rm -rf /var/www/html/index.html
# Copy the new index.html file and images directory to the container
COPY index.html /var/www/html/index.html
COPY images/ /var/www/html/images/

