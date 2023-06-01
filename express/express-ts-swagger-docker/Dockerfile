FROM node:19.6.0-bullseye-slim

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app
RUN npm run build:all

ENV NODE_ENV docker

EXPOSE 3000

CMD [ "npm", "run", "server" ]
