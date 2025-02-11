# Stage 1: Build RedisJSON
FROM rust:bullseye as redisgears-builder
USER root
RUN apt-get update && apt-get install -y build-essential git llvm libclang-dev
RUN apt-get install -qqy wget curl git openssl libssl-dev pkg-config clang

RUN git clone --recursive https://github.com/RedisGears/RedisGears.git /RedisGears
WORKDIR /RedisGears
RUN cargo build --release
