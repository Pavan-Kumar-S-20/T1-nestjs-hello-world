#!/bin/bash

# Navigate to the application directory
cd /home/ec2-user/hello-world

# Pull the latest changes from the main branch
git pull origin main

# Install dependencies
npm install

# Restart the application
pm2 restart all
