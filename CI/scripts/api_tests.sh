#!/bin/bash

# Base URL of the API
# BASE_URL="http://localhost:3000/api"
BASE_URL=${BASE_URL:-http://localhost:3000/api}

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to check API health
check_health() {
  echo "Checking API health..."
  response=$(curl -s -o /dev/null -w "%{http_code}" $BASE_URL/health)
  if [ "$response" -eq 200 ]; then
    echo -e "${GREEN}Health check passed!${NC}"
  else
    echo -e "${RED}Health check failed!${NC}"
  fi
}

# Function to create a user
create_user() {
  echo "Creating a user..."
  response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: application/json" \
    -d '{"id":"1", "name":"John Doe", "email":"john@example.com"}' $BASE_URL/users)
  if [ "$response" -eq 201 ]; then
    echo -e "${GREEN}User created successfully!${NC}"
  else
    echo -e "${RED}Failed to create user!${NC}"
  fi
}

# Function to get all users
get_users() {
  echo "Getting all users..."
  response=$(curl -s -w "\nHTTP Code: %{http_code}" -X GET $BASE_URL/users)
  echo "$response"
}

# Function to update a user
update_user() {
  echo "Updating user with ID 1..."
  response=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" \
    -d '{"name":"Jane Doe"}' $BASE_URL/users/1)
  if [ "$response" -eq 200 ]; then
    echo -e "${GREEN}User updated successfully!${NC}"
  else
    echo -e "${RED}Failed to update user!${NC}"
  fi
}

# Function to delete a user
delete_user() {
  echo "Deleting user with ID 1..."
  response=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $BASE_URL/users/1)
  if [ "$response" -eq 200 ]; then
    echo -e "${GREEN}User deleted successfully!${NC}"
  else
    echo -e "${RED}Failed to delete user!${NC}"
  fi
}

# Run tests
echo "Starting API Tests..."
check_health
create_user
get_users
update_user
delete_user
echo "API Tests Completed."