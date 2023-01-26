# Install docker:
========================

 sudo yum install -y yum-utils
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/rhel/docker-ce.repo


    or

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo


sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
or
dnf install docker-ce --nobest -y

sudo systemctl start docker && sudo systemctl enable docker

docker --version

sudo docker run hello-world (to test)


# Install Ansible

 sudo dnf update -y

 sudo dnf install python3

sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
sudo yum install ansible

ansible --version

 or 

alternatives --set python /usr/bin/python3

pip3 install -U pip setuptools
#pip3 install docker-compose

pip3 install --user ansible
pip3 list


if getting warnings " export PYTHONWARNINGS=ignore::UserWarning"


# Install git lab

mkdir /srv/gitlab
export GITLAB_HOME=/srv/gitlab

sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 8443:443 --publish 8081:80 --publish 24:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest


sudo docker logs -f gitlab

sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password

vXGM6Sjoo6lqt0jbM6NmqAXY2mEYfyC1UFFvpd+IeAk=


# Install Jenkins

docker network create jenkins

mkdir /srv/jenkins
export JENKINS_HOME=/srv/jenkins


docker run --name jenkins --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8082:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenkins:2.60.3

  or

  docker run -d -p 8082:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
or

docker run -d --name jenkins --restart=on-failure -p 8082:8080 -v $JENKINS_HOME/jenkins/ jenkins/jenkins  

  sudo docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword 


# deploy sample code on docker using jenkins file
=======================================================


jenkinsfile:


pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/devops4solutions/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push nikhilnidhi/samplewebapp:latest'
        //  sh  'docker push nikhilnidhi/samplewebapp:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            }
        }
    }
	}



# Jenkins-Email:

https://www.edureka.co/blog/email-notification-in-jenkins/

https://naiveskill.com/jenkins-pipeline-email-notification/

https://medium.com/@gustavo.guss/jenkins-sending-email-on-post-build-938b236545d2

https://www.youtube.com/watch?v=AzP1NWqQd_g

https://stackoverflow.com/questions/66050811/jenkins-manual-email-approval-before-deployment


# install Sonarqube on docker:
===============================

docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

