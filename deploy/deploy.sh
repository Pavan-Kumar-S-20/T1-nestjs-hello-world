#!/bin/bash

# Navigate to the project directory
cd /home/ec2-user/T1-nestjs-hello-world

# Pull the latest changes from the repository
git pull origin main

# Install dependencies
npm install

# Build the application
npm run build

# Check if pm2 is installed and run your application
if command -v pm2 &> /dev/null; then
    if pm2 describe app > /dev/null; then
        pm2 restart app --update-env
    else
        pm2 start dist/main.js --name app
    fi
else
    echo "pm2 is not installed. Please install pm2 globally: npm install -g pm2"
    exit 1
fi
