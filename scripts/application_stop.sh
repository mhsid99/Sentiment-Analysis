#!/bin/bash

echo "This script stops and removes Docker containers and images"

# Get the container ID of the running container
CONTAINER_ID=$(docker ps -q --filter "name=sentiment-analysis")

if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping container..."
  docker stop $CONTAINER_ID
  echo "Removing container..."
  docker rm $CONTAINER_ID
else
  echo "No running container found with the name flask_app"
fi

# Get the image ID of the Docker image
IMAGE_ID=$(docker images -q 339713186666.dkr.ecr.us-east-1.amazonaws.com/sentiment-analysis:latest )

if [ -n "$IMAGE_ID" ]; then
  echo "Removing image..."
  docker rmi $IMAGE_ID
else
  echo "No image found with the name 339713186666.dkr.ecr.us-east-1.amazonaws.com/sentiment-analysis:latest"
fi
