#!/bin/bash
echo "5th try.."
# Define your variables
ECR_REGISTRY="339713186666.dkr.ecr.us-east-1.amazonaws.com"
IMAGE_NAME="sentiment-analysis:latest"
AWS_REGION="us-east-1"

# Export the AWS CLI path if it's not in the PATH
export PATH=$PATH:/usr/local/bin

# Authenticate Docker to your ECR
aws ecr get-login-password --region $AWS_REGION | sudo docker login --username AWS --password-stdin $ECR_REGISTRY

# Check if the Docker image exists locally
if sudo docker image inspect $ECR_REGISTRY/$IMAGE_NAME &> /dev/null; then
    echo "Image exists locally."
else
    echo "Image does not exist locally, pulling from ECR."
    sudo docker pull $ECR_REGISTRY/$IMAGE_NAME
fi

# Run the container
sudo docker run -d $ECR_REGISTRY/$IMAGE_NAME
