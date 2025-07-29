#!/bin/bash

echo "Starting deployment..."

# Navigate to your project directory (update this path as needed)
cd /home/ubuntu/internal-app/internal-app2/my-remix-app || exit 

# Install dependencies
echo "Pulling latest code..."
git pull origin main

# Install dependencies
echo "Running npm install..."
npm i

# Build the project
echo "Building the project..."
npm run build

# Restart pm2 process
echo "Restarting PM2 process..."
pm2 restart 0

echo "Deployment completed successfully."
