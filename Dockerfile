# ----- Stage 1: Builder -----
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

# ----- Stage 2: Runtime -----
FROM node:18-slim

# Create app directory in smaller image
WORKDIR /app

# Copy only built app (not node_modules from dev tools)
COPY --from=builder /app /app
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
