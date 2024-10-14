#!/bin/bash

# Ensure the script itself is executable using its own name
chmod +x "$0"

# Check if the environment variable HACKERAPI_SECURITY_TOKEN exists on the host
if [ -z "$HACKERAPI_SECURITY_TOKEN" ]; then
  echo "Error: HACKERAPI_SECURITY_TOKEN environment variable is not set on the host."
  exit 1
fi

# Run a Docker container named "hackerapi"
docker run -d -i \
  --name hackerapi \
  --env HACKERAPI_SECURITY_TOKEN="$HACKERAPI_SECURITY_TOKEN" \
  nginx:latest

# Check if the container started successfully
if [ $? -eq 0 ]; then
  echo "Docker container 'hackerapi' started successfully."
else
  echo "Failed to start the Docker container 'hackerapi'."
fi
