
FROM snarayan112218/website

RUN rm /var/www/html/index.html

ADD ./index.html /var/www/html/index.html
