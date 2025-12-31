# A lightweight Node.js 20 image based on slim linux
FROM node:20-slim

# Sets the working directory inside the container
WORKDIR /app

# Copies package.json and package-lock.json files to the working directory
COPY package*.json package-lock.json* ./

# Installs the dependencies defined in package.json
RUN npm install 
# Copies the rest of the application code to the working directory
COPY . .


# Run the compiled JavaScript entrypoint
CMD ["npx", "ts-node", "main.ts"]