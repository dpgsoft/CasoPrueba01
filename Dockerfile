FROM node:20-alpine3.18 as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod
FROM nginx:1.23.3
COPY --from=build-step /app/dist/caso01 /usr/share/nginx/html