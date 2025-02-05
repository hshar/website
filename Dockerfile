# Use an official Ubuntu image (you can specify a version for consistency)
FROM ubuntu:20.04
 
# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
 
# Update package lists and install Apache in one RUN instruction,
# then clean up to reduce image size.
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
 
# Copy your web content into the Apache default directory.
# Using COPY instead of ADD when you don't need ADD's extra functionality.
COPY . /var/www/html/
 
# Expose port 80 (optional but useful for documentation)
EXPOSE 80
 
# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
