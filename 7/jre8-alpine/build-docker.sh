#!/bin/bash
#
# Script to build and upload a docker image for this project
#
# $1 - tag of the image, defaults to latest
# $2 - namespace (develop, master or release)
#

set -e

IMAGE_NAME=tomcat
TAG=7-jre8-alpine
NAMESPACE=test

DOCKER_VERSION=`docker --version | cut -f3 | cut -d '.' -f2`
[ ${DOCKER_VERSION} -lt 12 ] && TAG_FLAG='-f' || TAG_FLAG=''

docker build -t ${IMAGE_NAME} 7/jre8-alpine
docker tag  ${IMAGE_NAME} 639193537090.dkr.ecr.us-east-1.amazonaws.com/${NAMESPACE}/${IMAGE_NAME}:${TAG}
docker push 639193537090.dkr.ecr.us-east-1.amazonaws.com/${NAMESPACE}/${IMAGE_NAME}:${TAG}
docker tag  ${IMAGE_NAME} 639193537090.dkr.ecr.us-east-1.amazonaws.com/${NAMESPACE}/${IMAGE_NAME}:latest
docker push 639193537090.dkr.ecr.us-east-1.amazonaws.com/${NAMESPACE}/${IMAGE_NAME}:latest

