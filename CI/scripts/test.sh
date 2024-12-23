#!/bin/bash

# Define BASE_URL with a default value
BASE_URL=${BASE_URL:-http://localhost:3000/api}

echo "Testing service at: $BASE_URL"

# Make a request to the base URL
curl -s "$BASE_URL"