FROM raki1234/ubuntu

RUN rm /var/www/index.html

ADD ./index.html /var/lib/jenkins/workspace/prjct-1
