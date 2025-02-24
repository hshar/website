# Use Ubuntu as base image
FROM ubuntu:latest

# Install Apache and other dependencies
RUN apt-get update && apt-get install -y apache2 git

# Set the working directory
WORKDIR /var/www/html

# Install the application dependencies
RUN apt-get install -y curl

# Expose port 80 (Apache default) and 82 (for the website)
EXPOSE 80 82

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
