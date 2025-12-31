#!/bin/bash

APP_SERVER=10.0.2.137
IMAGE=012509421518.dkr.ecr.ap-south-1.amazonaws.com/healthcare-cicd-app:v1

ssh ubuntu@$APP_SERVER "
  docker stop healthcare-app || true &&
  docker rm healthcare-app || true &&
  docker pull $IMAGE &&
  docker run -d -p 3000:3000 --name healthcare-app $IMAGE
"
