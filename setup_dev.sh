#!/bin/bash

# Tạo volumes để mount mã nguồn vào các container
docker volume create backend-volume
docker volume create frontend-volume

# Khởi chạy MongoDB container
docker run -d --name mongodb -v mongodb-volume:/data/db mongo:4.2.0

# Khởi chạy backend Node.js container
docker run -d --name backend \
  -v $(pwd)/backend:/app \
  -p 3000:3000 \
  react-express-mongodb-backend

# Khởi chạy frontend React container
docker run -d --name frontend \
  -v $(pwd)/frontend:/app \
  -p 3001:3000 \
  react-express-mongodb-frontend
