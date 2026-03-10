#!/bin/bash

# 确保已安装了 buildx 插件
docker buildx install

# buildx 使用步骤-----
# 创建 buildx 构建器
#docker buildx create --name mybuilder --use
docker buildx create --name mybuilder --use --driver-opt env.httpproxy=127.0.0.1:7897
#docker buildx use mybuilder
docker buildx inspect --bootstrap

cat > Dockerfile <<EOF
# 使用多阶段构建
FROM openjdk:11 AS build
WORKDIR /app
COPY . /app
RUN javac Main.java

FROM openjdk:11
WORKDIR /app
COPY --from=build /app/Main.class /app
CMD ["java", "Main"]
EOF

# 使用 buildx 构建多架构镜像并推送
docker buildx build --platform linux/amd64,linux/arm64 -t myapp:latest --push .
#docker buildx build --platform linux/amd64,linux/arm64 -t myapp:latest .
#docker buildx push myapp:latest --platform linux/amd64
#docker buildx push myapp:latest --platform linux/arm64

# 验证多架构镜像
docker buildx imagetools inspect myapp:latest
# ---

# 假设有一个基于 Spring Boot 的微服务应用-----
cat > Dockerfile <<EOF
FROM openjdk:11 AS build
WORKDIR /app
COPY pom.xml ./
RUN mvn dependency:resolve
COPY . ./
RUN mvn package -DskipTests

FROM openjdk:11
WORKDIR /app
COPY --from=build /app/target/myapp.jar /app/myapp.jar
CMD ["java", "-jar", "myapp.jar"]
EOF

# 构建和推送多架构镜像
docker buildx build --platform linux/amd64,linux/arm64 -t myapp:1.0.0 --push .
# ---

# arm64-----
docker pull --platform linux/arm64 ubuntu:20.04

cat > Dockerfile <<EOF
FROM --platform=linux/arm64 ubuntu:20.04 as builder

# ... 安装软件包和配置 ...

FROM --platform=linux/amd64 ubuntu:20.04
COPY --from=builder /path/to/your/image /path/to/your/image
EOF

docker buildx build --platform linux/arm64 -t test:v1 .
# ---

# vim: set ft=bash fmr=-----,--- fdm=marker:
