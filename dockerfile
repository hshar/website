
FROM snarayan112218/dockerfilerebuild:v1

RUN rm /var/www/html/index.html

ADD ./index.html /var/www/html
