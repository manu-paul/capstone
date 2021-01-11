#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="pmanu1977/capstone-blue"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username dockerhub
docker image tag capstone-blue $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath
