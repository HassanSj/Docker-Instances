#!/bin/bash

# Build the new Docker image
docker build -t react-counter-app .

# Get the container ID of the running container
container_id=$(docker ps -q --filter ancestor=react-counter-app)

# Stop the running container if it exists
if [ -n "$container_id" ]; then
  docker stop $container_id
  docker rm $container_id
fi

# Run a new container with the updated image
docker run -d -p 3001:80 react-counter-app
