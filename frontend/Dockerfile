# Simple Frontend Dockerfile for Next.js
FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# FIX NETWORK ISSUE - ADD THIS LINE
RUN npm config set strict-ssl false

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build Next.js
RUN npm run build

# Expose port
EXPOSE 3000

# Start command
CMD ["npm", "start"]