# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (for efficient caching)
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Copy the rest of your application source code
COPY . .

# Create a non-root user to run the application (security best practice)
RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001
USER nodejs

# The port your backend app listens on
EXPOSE 5000

# The command to run your application
CMD ["node", "server.js"]
