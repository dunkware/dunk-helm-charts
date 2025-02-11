FROM docker.io/bitnami/redis-cluster:7.2.3-debian-11-r2 as redisearch-builder
USER root
RUN mkdir /redismodules
WORKDIR /redismodules
RUN apt-get update -y && \
    apt-get install -y git make llvm libclang-dev && \
    git clone https://github.com/RediSearch/RediSearch.git ./RediSearch
