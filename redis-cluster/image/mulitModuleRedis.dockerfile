# Stage 1: Build RedisJSON
FROM rust:bullseye as redisjson-builder
RUN apt-get update && apt-get install -y build-essential git llvm libclang-dev
RUN git clone https://github.com/RedisJSON/RedisJSON.git /RedisJSON
WORKDIR /RedisJSON
RUN cargo build --release

# Stage 2: Build RedisTimeSeries
FROM docker.io/bitnami/redis-cluster:7.2.3-debian-11-r2 as redistimeseries-builder
USER root
RUN mkdir /redismodules
RUN apt-get update -y && \
    apt-get install -y git make && \
    git clone --recursive https://github.com/RedisTimeSeries/RedisTimeSeries.git /RedisTimeSeries && \
    cd /RedisTimeSeries && \
    ./sbin/setup && \
    bash -l && \
    make && \
    mv ./bin/linux-x64-release/redistimeseries.so /redismodules/redistimeseries.so && \
    cd /redismodules/ && \
    rm -rf /RedisTimeSeries

# Stage 3: Build RediSearch
FROM docker.io/bitnami/redis-cluster:7.2.3-debian-11-r2 as redisearch-builder
USER root
RUN apt-get update && apt-get install -y build-essential git cmake llvm libclang-dev gcc
RUN git clone --recursive https://github.com/RediSearch/RediSearch.git /RediSearch
WORKDIR /RediSearch
RUN make setup && make build 
RUN mkdir /redismodules && mv /RediSearch/bin/linux-x64-release/search/redisearch.so /redismodules/redisearch.so

# Stage 4: Build RedisBloom
FROM docker.io/bitnami/redis-cluster:7.2.3-debian-11-r2 as redisbloom-builder
USER root
RUN mkdir /redismodules
RUN apt-get update -y && \
    apt-get install -y git make && \
    git clone --recursive https://github.com/RedisBloom/RedisBloom.git /RedisBloom && \
    cd /RedisBloom && \
    ./sbin/setup && \
    bash -l && \
    make
RUN mv /RedisBloom/bin/linux-x64-release/redisbloom.so /redismodules/redisbloom.so && \
    cd /redismodules/ && \
    rm -rf /RedisBloom

# stage 5: build redis gears 
FROM rust:bullseye as redisgears-builder
USER root
RUN apt-get update && apt-get install -y build-essential git llvm libclang-dev
RUN git clone --recursive --branch v2.0.16-m17 https://github.com/RedisGears/RedisGears.git /RedisGears
WORKDIR /RedisGears
RUN cargo build --release


# Stage 5: Create the final image
FROM docker.io/bitnami/redis-cluster:7.2.3-debian-11-r2
COPY --from=redisgears-builder /RedisGears/target/release/*.so /redismodules/
COPY --from=redisjson-builder /RedisJSON/target/release/librejson.so /redismodules/
COPY --from=redistimeseries-builder /redismodules/redistimeseries.so /redismodules/
COPY --from=redisearch-builder /redismodules/redisearch.so /redismodules/
COPY --from=redisbloom-builder /redismodules/redisbloom.so /redismodules/

WORKDIR /
USER 1001
