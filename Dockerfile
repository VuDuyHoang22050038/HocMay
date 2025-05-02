# Bước 1: Sử dụng một image Node.js chính thức làm base image
FROM node:16-alpine

# Bước 2: Đặt thư mục làm việc trong container
WORKDIR /usr/src/app

# Bước 3: Sao chép file package.json và package-lock.json từ thư mục gốc vào container
COPY package*.json ./

# Bước 4: Cài đặt các phụ thuộc (dependencies) của dự án
RUN npm install

# Bước 5: Sao chép toàn bộ mã nguồn từ thư mục src vào container
COPY ./src ./

# Bước 6: Sao chép file .env vào container
COPY .env .env

# Bước 7: Mở port 4000 (hoặc port mà ứng dụng của bạn đang sử dụng)
EXPOSE 4000

# Bước 8: Chạy ứng dụng Node.js khi container được khởi động
CMD ["node", "index.js"]
