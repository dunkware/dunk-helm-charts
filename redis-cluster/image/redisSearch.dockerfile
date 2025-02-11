FROM rust:bullseye as redisearch-builder
RUN apt-get update && apt-get install -y build-essential git cmake llvm libclang-dev
RUN git clone https://github.com/RediSearch/RediSearch.git /RediSearch
WORKDIR /RediSearch
RUN make setup && make build
