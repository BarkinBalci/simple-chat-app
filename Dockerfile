FROM node:14

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY public/ ./public
COPY server.js ./

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s CMD curl -f http://localhost:8080 || exit 1


CMD ["node", "server.js"]