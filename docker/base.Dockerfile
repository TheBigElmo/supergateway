FROM node:24-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build TypeScript sources
RUN npm run build

# Install package globally to make it available as 'supergateway'
RUN npm install -g .

# Expose port
EXPOSE 8000

# Set entrypoint and default command
ENTRYPOINT ["supergateway"]
CMD ["--help"]
