FROM ubuntu:22.04

RUN apt-get update && apt-get install nginx -y && rm -rf /var/lib/apt/lists/*

COPY index.html /var/www/html/

COPY images/ /var/www/html/

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
