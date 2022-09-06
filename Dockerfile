From ubuntu:20.04
RUN apt-get update 
RUN apt-get install -y nginx
COPY ./index.html  /var/www/html/index.html 
ENV name ankit
WORKDIR  /tmp 
EXPOSE 80 
ENTRYPOINT [“nginx”, “-g”, “daemon off;”]
