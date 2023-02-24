FROM ubuntu
RUN sudo apt update -y &&sudo apt install apache2 -y
COPY . /var/www/html/
ENTRYPOINT -DFOREGROUND
