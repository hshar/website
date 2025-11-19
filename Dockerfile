# Base image
FROM ubuntu:20.04

# Set non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install Apache
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    apt-get clean

# Create working directory
WORKDIR /var/www/html

# Copy website code into the container
COPY . /var/www/html

# Change Apache to listen on port 82 instead of 80
RUN sed -i 's/Listen 80/Listen 82/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:82>/' /etc/apache2/sites-available/000-default.conf

# Expose port 82 for publishing website
EXPOSE 82

# Start Apache in foreground (required for Docker)
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
