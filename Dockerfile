# Check out https://hub.docker.com/_/node to select a new base image
FROM node:10-slim

# Set to a non-root built-in user `node`
# USER node

# Create app directory (with user `node`)
RUN mkdir -p /home/node/app

WORKDIR /home/node/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY --chown=node package*.json ./
COPY package*.json ./

RUN npm install

# Bundle app source code
# COPY --chown=node . .
COPY . .

RUN npm run build
RUN mv docker_start.sh ..

# Bind to all network interfaces so that it can be mapped to the host OS
# ENV HOST=0.0.0.0 PORT=3000

# EXPOSE ${PORT}

EXPOSE 3000
CMD ["sh", "../docker_start.sh"]

# FROM node:10.16-alpine AS build

# WORKDIR /usr/src/app
# COPY package.json ./
# RUN npm install
# COPY . .

# RUN npm run build

# FROM nginx:1.17.1-alpine

# COPY --from=build /usr/src/app/dist /usr/share/nginx/html

