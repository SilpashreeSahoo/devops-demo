# Dockerfile contents (located in devops-demo/)
FROM node:22-alpine as build-stage

WORKDIR /app

# Copy the entire vite-project directory into /app
# This assumes 'vite-project' is a direct child of the directory where Dockerfile resides
COPY v/package*.json ./ # Copy package files from the subfolder
RUN npm install                     # This will now look for package.json in /app

COPY v . ./              # Copy the rest of the project files from subfolder
RUN npm run build

# ... rest of your multi-stage build (if any)

