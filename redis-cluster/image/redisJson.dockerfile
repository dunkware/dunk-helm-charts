# Stage 1: Build RedisJSON
FROM rust:bullseye as redisjson-builder
RUN apt-get update && apt-get install -y build-essential git llvm libclang-dev
RUN git clone https://github.com/RedisJSON/RedisJSON.git /RedisJSON
WORKDIR /RedisJSON
RUN cargo build --release
