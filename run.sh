#!/bin/bash

# Set environment variables
CONTAINER_NAME="activemq_broker_container"
IMAGE_NAME="apache/activemq-classic"
PORTS="-p 8161:8161 -p 5672:5672"

# Stop and remove any running container with the same name
docker stop $CONTAINER_NAME >/dev/null 2>&1 || true
docker rm $CONTAINER_NAME >/dev/null 2>&1 || true

# Pull the latest ActiveMQ image
docker pull $IMAGE_NAME

# Run the container
docker run --name "$CONTAINER_NAME" \
    $PORTS \
    "$IMAGE_NAME" || {
    echo "Error: Failed to start the ActiveMQ container."
    exit 1
}
