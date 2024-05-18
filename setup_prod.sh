#!/bin/bash

# Khởi chạy MongoDB container
docker run -d --name mongodb mongo:4.2.0

# Khởi chạy backend Node.js container
docker run -d --name backend \
  -e NODE_ENV=production \
  -p 3000:3000 \
  react-express-mongodb-backend

# Khởi chạy frontend React container
docker run -d --name frontend \
  -e NODE_ENV=production \
  -p 3001:3000 \
  react-express-mongodb-frontend

# Khởi chạy Nginx container (nếu bạn sử dụng Nginx)
docker run -d --name nginx \
  -p 80:80 \
  your-nginx-image
