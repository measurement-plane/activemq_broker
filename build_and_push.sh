#!/bin/bash

# Variables
IMAGE_NAME="custom-activemq"
DOCKER_REGISTRY="amlabdr"
TAG="latest" 

# Build the Docker image
echo "Building the Docker image..."
docker build -t ${IMAGE_NAME}:${TAG} .

# Tag the image for the registry
echo "Tagging the image..."
docker tag ${IMAGE_NAME}:${TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG}

# Push the image to the registry
echo "Pushing the image to the registry..."
docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG}

echo "Build and push complete. Image: ${DOCKER_REGISTRY}/${IMAGE_NAME}:${TAG}"
