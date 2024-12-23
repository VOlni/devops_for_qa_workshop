#!/bin/bash

# Use the environment variable BASE_URL
BASE_URL=${BASE_URL:-http://localhost:3000}

# Test 1: Check if the service is running
echo "Test 1: Checking service status at $BASE_URL..."
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL")
if [ "$response" -eq 200 ]; then
  echo "PASS: Service is up and running!"
else
  echo "FAIL: Service is not reachable (HTTP $response)"
fi

# Add additional tests as needed...