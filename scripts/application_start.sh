echo "Running container..."
docker run --name flask_app -d -p 5000:5000 339713186666.dkr.ecr.us-east-1.amazonaws.com/sentiment-analysis:latest