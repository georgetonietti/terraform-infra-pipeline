#!/bin/bash

sudo su
yum update -y
yum install -y docker
service docker start
usermod -a -G docker ec2-user

docker pull "${docker_image}"
docker run -d -p 80:8080 "${docker_image}"