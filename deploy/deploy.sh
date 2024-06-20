#!/bin/bash

# Navigate to your home directory
cd /home/ec2-user

# Clone the repository if it doesn't exist, otherwise pull the latest changes
if [ ! -d "T1-nestjs-hello-world" ]; then
    git clone https://github.com/your-username/T1-nestjs-hello-world.git
fi

# Navigate to the repository directory
cd T1-nestjs-hello-world

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
    sudo npm install -g pm2
    pm2 start dist/main.js --name app
fi
