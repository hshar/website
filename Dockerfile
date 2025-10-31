# Use an official Apache base image
FROM ubuntu:20.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Create web directory (default for Apache on Ubuntu)
RUN mkdir -p /var/www/html

# Copy website files (index.html, images, etc.) into /var/www/html
COPY . /var/www/html/

# Optional: suppress Apache ServerName warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache in the foreground (so container keeps running)
CMD ["apachectl", "-D", "FOREGROUND"]
