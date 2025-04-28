# 使用 Node.js 镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制所有文件
COPY . .

# 使用 static-web-server 镜像作为最终镜像
FROM joseluisq/static-web-server:2

# 从构建阶段复制构建产物
COPY --from=0 /app/dist /public

# 暴露端口
EXPOSE 80