FROM node:20-slim

WORKDIR /app

COPY . .

COPY package.json package-lock.json* ./
RUN npm install


ENTRYPOINT []

CMD ["npx", "ts-node", "main.ts"]
