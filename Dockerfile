FROM node:16-alpine
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm install -g ts-node
CMD ["npm", "run", "prod"]
