FROM node:16-alpine as builder

WORKDIR '/app'

COPY ./package.json .

RUN npm install

COPY . .

RUN npm run build




FROM nginx

COPY --from=builder /app/build  /usr/share/nginx/html



#nginx runs on port 80, so the command is " docker run -p <desired-port>:80 <image-id> "