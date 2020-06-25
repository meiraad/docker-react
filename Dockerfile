#this is one temp container
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#this is another temp container
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html