# Base URL of the API
$BASE_URL = "http://localhost:3000/api"

# Colors for output
$GREEN = "`e[32m"
$RED = "`e[31m"
$NC = "`e[0m" # No Color

# Function to check API health
function Check-Health {
    Write-Host "Checking API health..."
    $response = Invoke-WebRequest -Uri "$BASE_URL/health" -Method GET -ErrorAction SilentlyContinue
    if ($response.StatusCode -eq 200) {
        Write-Host "${GREEN}Health check passed!${NC}"
    } else {
        Write-Host "${RED}Health check failed!${NC}"
    }
}

# Function to create a user
function Create-User {
    Write-Host "Creating a user..."
    $body = @{
        id = "1"
        name = "John Doe"
        email = "john@example.com"
    } | ConvertTo-Json -Depth 1

    $response = Invoke-WebRequest -Uri "$BASE_URL/users" -Method POST -Body $body -ContentType "application/json" -ErrorAction SilentlyContinue
    if ($response.StatusCode -eq 201) {
        Write-Host "${GREEN}User created successfully!${NC}"
    } else {
        Write-Host "${RED}Failed to create user!${NC}"
    }
}

# Function to get all users
function Get-Users {
    Write-Host "Getting all users..."
    $response = Invoke-WebRequest -Uri "$BASE_URL/users" -Method GET -ErrorAction SilentlyContinue
    if ($response.StatusCode -eq 200) {
        $response.Content | ConvertFrom-Json | Format-Table
    } else {
        Write-Host "${RED}Failed to retrieve users!${NC}"
    }
}

# Function to update a user
function Update-User {
    Write-Host "Updating user with ID 1..."
    $body = @{
        name = "Jane Doe"
    } | ConvertTo-Json -Depth 1

    $response = Invoke-WebRequest -Uri "$BASE_URL/users/1" -Method PUT -Body $body -ContentType "application/json" -ErrorAction SilentlyContinue
    if ($response.StatusCode -eq 200) {
        Write-Host "${GREEN}User updated successfully!${NC}"
    } else {
        Write-Host "${RED}Failed to update user!${NC}"
    }
}

# Function to delete a user
function Delete-User {
    Write-Host "Deleting user with ID 1..."
    $response = Invoke-WebRequest -Uri "$BASE_URL/users/1" -Method DELETE -ErrorAction SilentlyContinue
    if ($response.StatusCode -eq 200) {
        Write-Host "${GREEN}User deleted successfully!${NC}"
    } else {
        Write-Host "${RED}Failed to delete user!${NC}"
    }
}

# Run tests
Write-Host "Starting API Tests..."
Check-Health
Create-User
Get-Users
Update-User
Delete-User
Write-Host "API Tests Completed."