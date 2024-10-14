#!/bin/bash

# Eliminate the Docker container named "frontend" if it exists
if [ "$(docker ps -a -q -f name=frontend)" ]; then
  echo "Stopping and removing the 'frontend' container..."
  docker stop frontend && docker rm frontend
else
  echo "Container 'frontend' not found."
fi

# Eliminate all Docker images that reference the "httpd" repository
echo "Removing all Docker images from the 'httpd' repository..."
docker images | grep "httpd" | awk '{print $3}' | xargs docker rmi -f

# Notify the user
echo "Docker container 'frontend' and all 'httpd' images have been removed (if they existed)."
