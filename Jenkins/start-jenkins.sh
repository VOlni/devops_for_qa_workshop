#!/bin/bash

docker run -d -p 8080:8080 -p 50000:50000 \                                
    --name jenkins \
    -v jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jenkins/jenkins:lts