FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node:latest /app/dist/crud-tuto-front /usr/share/nginx/html