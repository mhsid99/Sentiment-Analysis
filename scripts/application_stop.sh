#!/bin/bash
echo "Try 2...."
# Check if the Docker image exists
if sudo docker image inspect sentiment-analysis & /dev/null; then
    # Stop and remove containers based on the image
    sudo docker stop $(sudo docker ps -a -q --filter ancestor=sentiment-analysis)
    sudo docker rm $(sudo docker ps -a -q --filter ancestor=sentiment-analysis)
    
    # Remove the Docker image
    sudo docker rmi sentiment-analysis
else
    echo "Image sentiment-analysis does not exist, skipping removal."
fi
