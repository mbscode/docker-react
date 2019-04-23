FROM node:alpine as build-stage-1

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build-stage-1 /app/build /usr/share/nginx/html