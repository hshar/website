FROM ubuntu
RUN sudo apt update -y
RUN sudo apt install apache2 -y
COPY /home/jenkins/ubuntu/workspace/MasterBranch/index.html /var/www/html/
ENTRYPOINT sudo apachectl -D FOREGROUND
ENV name casestudy
