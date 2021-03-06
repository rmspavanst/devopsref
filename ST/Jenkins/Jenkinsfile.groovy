#!/usr/bin/env grrovy

library identifier: 'jenkins-shared-library@master', retriver: modernSCM(
    [$class: 'GitSCMSource',
     remote: 'https://github.com/rmspavan/webapp.git',
     credentialsId: 'github-credentials'
    ]
)

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    environment {
        IMAGE_NAME = 'rmspavan/webapp:1.0'
    }
    stages {
        stage('build add') {
            steps {
                script {
                    echo 'building application jar...'
                    buildJar()
                } 
            }
        }
        stage('build image') {
            steps {
                script {
                    echo 'building docker image...'
                    buildImage(env.IMAGE_NAME)
                    dockerLogin()
                    dokcerPush(env.IMAGE_NAME)
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo 'deploying docker image to EC2...'
                    def dockerCmd = 'docker run -p 8080:8080 -d ${IMAGE_NAME}'
                    sshagent(['ec2-server-key']) #generate this in pipelinesystax
                        sh "ssh -o StingHostKeyChecking=no ec2-user@3.170.12.64 ${dockerCmd}"
                }
            }
        }        
    }
}