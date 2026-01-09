FROM node:20-slim

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install

# COPY . .

ENTRYPOINT []

CMD ["npx", "ts-node", "main.ts"]
