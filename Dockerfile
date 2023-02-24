FROM ubuntu
RUN sudo apt update -y 
RUN sudo apt install apache2 -y
ADD  . /var/www/html/
ENTRYPOINT -DFOREGROUND
