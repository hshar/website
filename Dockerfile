# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package list and install Apache2
RUN apt-get update && apt-get install -y apache2

# Add content to the web server's root directory
ADD . /var/www/html

# Expose port 80 to allow web traffic
EXPOSE 80

# Start the Apache2 service in the foreground
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
