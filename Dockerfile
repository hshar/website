From ubuntu
Run apt update
Run apt install apache2 -y
ADD ./Var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
