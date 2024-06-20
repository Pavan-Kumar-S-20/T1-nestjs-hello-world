#!/bin/bash

# Navigate to your application directory
cd "/home/ec2-user/T1-nestjs-hello-world"

# Pull the latest changes from the repository
git pull origin main

# Install dependencies
npm install

# Build the application
npm run build

# Check if pm2 is installed and run your application
if command -v pm2 &> /dev/null; then
    pm2 restart app
else
    echo "pm2 is not installed. Please install pm2 globally: npm install -g pm2"
    exit 1
fi
