Stephen Shenk _ devops_capstone project 2nd october 2023


   1  sudo apt update
    2  sudo apt-get install software-properties-common
    3  sudo apt-add-repository --yes --update ppa:ansible/ansible
    4  sudo apt-get install ansible
    5  ansible --version
    6  ssh-key-gen
    7  ssh-keygen
    8  sudo cat /home/ubuntu/.ssh/id_rsa.pub
    9  cd /etc/ansible
   10  ls 
   11  sudo nano hosts
   12  ansible -m ping all
   13  sudo nano install.yaml
   14  history
   15  cd /etc/ansible
   16  sudo nano hosts
   17  ansible -m ping all
   18  sudo nano install.yaml
   19  sudo nano jenkins.sh
   20  sudo nano docker.sh
   21  ls
   22  ansible-playbook install.yaml --syntax-check
   23  ansible-playbook install.yaml --check
   24  ansible-playbook install.yaml 
   25  jenkins --version
   26  java --version
   27  ansible --version
   28  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   29  cd
   30  git clone https://github.com/StephenShenk1/website.git
   31  ls
   32  cd website
   33  ls
   34  history
   35  sudo nano Dockerfile
   36  git status
   37  git add .
   38  git commit -m "first commit"
   39  git branch
   40  git branch develop
   41  git branch
   42  ls
   43  git push origin --all
   44  pwd
   45  cd
   46  pwd
   47  history


Docker container deletion command and build
sudo docker rm -f $(sudo docker ps -a -q)
sudo docker build /home/ubuntu/jenkins/workspace/job1 -t developapp
sudo docker run -it -d -p 81:80 developapp
 

Or we can change port number and App name  or delete current container image

Prod

    1  sudo apt update
    2  cd .ssh
    3  ls
    4  sudo nano authorized_keys
    5  java --version
    6  docker --version
    7  cd
    8  docker --version
    9  ls
   10  cd jenkins
   11  ls
   12  cd workspace
   13  ls
   14  cd job3
   15  ls


Test 

 1  sudo apt update
    2  cd .ssh
    3  ls
    4  sudo nano authorized_keys
    5  java --version
    6  docker --version
    7  cd
    8  java --version
    9  docker --version
   10  ls
   11  cd jenkins
   12  ls
   13  cd workspace
   14  ls
   15  cd
   16  ls
   17  cd jenkins
   18  ls
   19  cd workspace
   20  ls
   21  rm job1@tmp
   22  ls
   23  cd jobs2
   24  cd job2
   25  pwd
   26  cd workspace
   27  ls
   28  history



Ansible installation: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu
Jenkins installation: https://www.jenkins.io/doc/book/installing/linux/#debianubuntu
============================================================
(install.yaml)

---
 - hosts: localhost
   become: true
   name: install Jenkins, Java and Docker
   tasks: 
   - name: master task
     script: jenkins.sh
 - hosts: test
   become: true 
   name: install Java and Docker
   tasks:
   - name: test task
     script: docker.sh
 - hosts: prod
   become: true
   name: install Java and Docker
   tasks:
   - name: prod task
     script: docker.sh

============================================

(Jenkins.sh)

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install openjdk-11-jdk -y
sudo apt-get install docker.io -y
sudo apt-get install jenkins -y

====================================================
(docker.sh)

sudo apt-get update
sudo apt-get install openjdk-11-jdk -y
sudo apt-get install docker.io -y
===============================================
(Dockerfile)

FROM ubuntu
RUN apt update
RUN apt install apache2 -y
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND


