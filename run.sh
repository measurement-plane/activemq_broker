#!/bin/bash

# Set environment variables
CONTAINER_NAME="activemq_broker_container"
IMAGE_NAME="amlabdr/custom-activemq"
PORTS="-p 8161:8161 -p 5672:5672"

# Stop and remove any running container with the same name
docker stop $CONTAINER_NAME >/dev/null 2>&1 || true
docker rm $CONTAINER_NAME >/dev/null 2>&1 || true

# Attempt to pull the latest image
echo "Attempting to pull the latest image..."
if docker pull "$IMAGE_NAME"; then
    echo "Successfully pulled the latest image."
else
    echo "Warning: Failed to pull the image. Using the existing local image, if available."
fi

# Run the container
docker run --name "$CONTAINER_NAME" \
    $PORTS \
    "$IMAGE_NAME" || {
    echo "Error: Failed to start the ActiveMQ container."
    exit 1
}
